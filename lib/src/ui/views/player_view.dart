import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:tengoku/src/models/source.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/mixins/enforce_required_orientation_mixin.dart';
import 'package:tengoku/src/ui/components/player/custom_player_controls.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView>
    with EnforceRequiredOrientation<PlayerView> {
  String? src;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async =>
          Navigator.of(context).userGestureInProgress ? false : true,
      child: Builder(
        builder: (context) {
          if (_chewieController != null) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Chewie(controller: _chewieController!),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        },
      ),
    );
  }

  Future<void> _initialize() async {
    final ConsumetProvider consumetProvider =
        Provider.of<ConsumetProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        // When source fetched; if not null, find and use default quality URL.
        if (consumetProvider.currentEpisodeSource != null) {
          final Source source = consumetProvider.currentEpisodeSource!;
          src = source.videos
              .where((video) => video.quality == 'default')
              .first
              .url;
          _videoPlayerController =
              VideoPlayerController.network(src!, httpHeaders: source.headers);
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController!,
            aspectRatio: 16 / 9,
            autoPlay: true,
            allowFullScreen: true,
            fullScreenByDefault: true,
            customControls: CustomPlayerControls(
              backgroundColor: Colors.transparent,
              iconColor: Colors.white,
              animeInfo: consumetProvider.currentAnimeInfo!,
              episode: consumetProvider.selectedEpisode!,
            ),
            // TODO: Error Builder...
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
