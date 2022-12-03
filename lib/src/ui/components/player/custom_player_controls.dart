// ignore_for_file: implementation_imports
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/helpers/utils.dart';
import 'package:chewie/src/notifiers/index.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_episode.dart';

// TODO: Actually write custom player UI...
class CustomPlayerControls extends StatefulWidget {
  final Color backgroundColor;
  final Color iconColor;
  final AnimeInfo animeInfo;
  final AnimeEpisode episode;
  final bool showPlayButton;

  const CustomPlayerControls({
    required this.backgroundColor,
    required this.iconColor,
    required this.animeInfo,
    required this.episode,
    this.showPlayButton = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPlayerControls> createState() => _CustomPlayerControlsState();
}

class _CustomPlayerControlsState extends State<CustomPlayerControls>
    with SingleTickerProviderStateMixin {
  late PlayerNotifier playerNotifier;
  late VideoPlayerValue _latestValue;
  double? _latestVolume;
  Timer? _hideTimer;
  Timer? _expandCollapseTimer;
  Timer? _initTimer;
  bool _dragging = false;
  Duration? _subtitlesPosition;
  bool _subtitleOn = false;
  Timer? _bufferingDisplayTimer;
  bool _displayBufferingIndicator = false;

  late VideoPlayerController controller;

  // _chewieController is set in didChangeDependencies()
  ChewieController get chewieController => _chewieController!;
  ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      return chewieController.errorBuilder != null
          ? chewieController.errorBuilder!(
              context,
              chewieController.videoPlayerController.value.errorDescription!,
            )
          : const Center(
              child: Icon(
                EvaIcons.alertCircleOutline,
                color: Colors.white,
                size: 42,
              ),
            );
    }

    final backgroundColor = widget.backgroundColor;
    final iconColor = widget.iconColor;
    final orientation = MediaQuery.of(context).orientation;
    final barHeight = orientation == Orientation.portrait ? 30.0 : 47.0;
    final buttonPadding = orientation == Orientation.portrait ? 16.0 : 24.0;

    return MouseRegion(
      onHover: (_) => _cancelAndRestartTimer(),
      child: GestureDetector(
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: playerNotifier.hideStuff,
          child: Stack(
            children: [
              _buildSkipControlAreas(),
              AnimatedOpacity(
                opacity: playerNotifier.hideStuff ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildInfoBar(
                      backgroundColor,
                      iconColor,
                      barHeight,
                      buttonPadding,
                    ),
                    const Spacer(),
                    _buildBottomBar(backgroundColor, iconColor, barHeight),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: playerNotifier.hideStuff ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildSkipBackButton(),
                      _buildPlayPauseToggle(),
                      _buildSkipForwardButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Widgets */
  Widget _buildInfoBar(Color backgroundColor, Color iconColor, double barHeight,
      double buttonPadding) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.animeInfo.title.romaji ?? widget.animeInfo.title.userPreferred!} • EP${widget.episode.number}',
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: Color(0xff999999),
                  ),
                ),
                Text(
                  widget.episode.title ?? 'Episode ${widget.episode.number}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: BouncingWidget(
              scaleFactor: 0.75,
              duration: const Duration(milliseconds: 100),
              onPressed: () => Navigator.pop(context),
              child: const Icon(EvaIcons.close, size: 37.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkipBackButton() {
    return BouncingWidget(
      scaleFactor: 0.75,
      duration: const Duration(milliseconds: 100),
      onPressed: _skipBack,
      child: Container(
        height: 48,
        color: Colors.transparent,
        child: Icon(
          FontAwesomeIcons.rotateLeft,
          color: widget.iconColor.withOpacity(0.85),
          size: 36,
        ),
      ),
    );
  }

  GestureDetector _buildPlayPauseToggle() {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        color: Colors.transparent,
        child: Icon(
          chewieController.isPlaying
              ? FontAwesomeIcons.pause
              : FontAwesomeIcons.play,
          color: widget.iconColor,
          size: 48,
        ),
      ),
    );
  }

  Widget _buildSkipForwardButton() {
    return BouncingWidget(
      scaleFactor: 0.75,
      duration: const Duration(milliseconds: 100),
      onPressed: _skipForward,
      child: Container(
        height: 48,
        color: Colors.transparent,
        child: Icon(
          FontAwesomeIcons.rotateRight,
          color: widget.iconColor.withOpacity(0.85),
          size: 36,
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    final maxWidth = MediaQuery.of(context).size.width * 0.9;
    final position = _latestValue.position;
    final duration = _latestValue.duration;

    final progressAsWidth =
        (maxWidth * (position.inSeconds.isNaN ? 0 : position.inSeconds)) /
            (duration.inSeconds.isNaN ? 1 : duration.inSeconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onHorizontalDragStart: ((details) => setState(
                () => _dragging = true,
              )),
          onHorizontalDragEnd: ((details) => setState(
                () => _dragging = false,
              )),
          onHorizontalDragUpdate: (details) {
            _cancelAndRestartTimer();
            // Seek player to current position in video:
            final newPosition = details.localPosition.dx / maxWidth;
            clampDouble(newPosition, 0.0, 1.0);
            chewieController.seekTo(
              Duration(
                seconds:
                    (newPosition * _latestValue.duration.inSeconds).round(),
              ),
            );
          },
          child: SizedBox(
            width: maxWidth,
            height: 20,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: maxWidth,
                  height: _dragging ? 16 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: position.inSeconds.isNaN || position.inSeconds <= 0
                      ? 0
                      : progressAsWidth,
                  height: _dragging ? 16 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeProgression() {
    final position = _latestValue.position;
    final duration = _latestValue.duration;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            '${formatDuration(position)}/${formatDuration(duration)}',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: widget.iconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
      Color backgroundColor, Color iconColor, double barHeight) {
    return SafeArea(
      bottom: chewieController.isFullScreen,
      minimum: chewieController.controlsSafeAreaMinimum,
      child: AnimatedOpacity(
        opacity: playerNotifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(children: <Widget>[
            Row(
              // TODO: Additional Icons + Functionality...
              children: <Widget>[],
            ),
            _buildProgressBar(),
            _buildTimeProgression(),
          ]),
        ),
      ),
    );
  }

  Row _buildSkipControlAreas() {
    final halfWidth = MediaQuery.of(context).size.width * 0.5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <GestureDetector>[
        GestureDetector(
          onDoubleTap: _skipBack,
          child: Container(
            width: halfWidth,
            color: Colors.transparent,
          ),
        ),
        GestureDetector(
          onDoubleTap: _skipForward,
          child: Container(
            width: halfWidth,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  /* Utilities */
  void _subtitleToggle() {
    setState(() {
      _subtitleOn = !_subtitleOn;
    });
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();

    setState(() {
      playerNotifier.hideStuff = false;

      _startHideTimer();
    });
  }

  void _playPause() {
    final isFinished = _latestValue.position >= _latestValue.duration;

    setState(() {
      if (controller.value.isPlaying) {
        playerNotifier.hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  void _skipBack() {
    _cancelAndRestartTimer();
    final beginning = Duration.zero.inMilliseconds;
    final skip =
        (_latestValue.position - const Duration(seconds: 10)).inMilliseconds;
    controller.seekTo(Duration(milliseconds: math.max(skip, beginning)));
  }

  void _skipForward() {
    _cancelAndRestartTimer();
    final end = _latestValue.duration.inMilliseconds;
    final skip =
        (_latestValue.position + const Duration(seconds: 10)).inMilliseconds;
    controller.seekTo(Duration(milliseconds: math.min(skip, end)));
  }

  void _startHideTimer() {
    final hideControlsTimer = chewieController.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : chewieController.hideControlsTimer;
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        playerNotifier.hideStuff = true;
      });
    });
  }

  void _bufferingTimerTimeout() {
    _displayBufferingIndicator = true;
    if (mounted) {
      setState(() {});
    }
  }

  /* State */
  void _updateState() {
    if (!mounted) return;

    // Display progress bar after buffering delay (if set).
    if (chewieController.progressIndicatorDelay != null) {
      if (controller.value.isBuffering) {
        _bufferingDisplayTimer ??= Timer(
          chewieController.progressIndicatorDelay!,
          _bufferingTimerTimeout,
        );
      } else {
        _bufferingDisplayTimer?.cancel();
        _bufferingDisplayTimer = null;
        _displayBufferingIndicator = false;
      }
    } else {
      _displayBufferingIndicator = controller.value.isBuffering;
    }

    setState(() {
      _latestValue = controller.value;
      _subtitlesPosition = controller.value.position;
    });
  }

  Future<void> _initialize() async {
    _subtitleOn = chewieController.subtitle?.isNotEmpty ?? false;
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          playerNotifier.hideStuff = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    playerNotifier = Provider.of<PlayerNotifier>(context, listen: false);
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _expandCollapseTimer?.cancel();
    _initTimer?.cancel();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }
}
