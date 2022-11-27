import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:tengoku/src/models/source.dart';
import 'package:tengoku/src/mixins/orientation_mixins.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class PlayerView extends StatefulWidget {
  final String episodeId;
  const PlayerView({super.key, required this.episodeId});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView>
    with ForceLandscapeStatefulModeMixin<PlayerView> {
  String? src;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async =>
          Navigator.of(context).userGestureInProgress ? false : true,
      child: Consumer<ConsumetProvider>(
        builder: ((context, provider, child) {
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
        }),
      ),
    );
  }

  Future<void> initPlayer() async {
    final ConsumetProvider provider =
        Provider.of<ConsumetProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await provider.getStreamingLinksFromEpisodeId(widget.episodeId);
        // When source fetched; if not null, find and use default quality URL.
        if (provider.currentAnimeSource != null) {
          final Source source = provider.currentAnimeSource!;
          src = source.videos
              .where((video) => video.quality == "default")
              .first
              .url;
          // Video Player & Chewie: Initialization.
          _videoPlayerController = VideoPlayerController.network(src!);
          _videoPlayerController!.initialize();

          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController!,
            aspectRatio: 16 / 9,
            fullScreenByDefault: true,
            allowFullScreen: false,
            allowedScreenSleep: false,
            // TODO: Error Builder, Custom Controls...
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
