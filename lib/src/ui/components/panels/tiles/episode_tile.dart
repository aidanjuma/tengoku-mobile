import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/router/routes.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/router/navigator_wrapper.dart';
import 'package:tengoku/src/providers/isar_provider.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class EpisodeTile extends StatelessWidget {
  final AnimeEpisode episode;
  const EpisodeTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Consumer2<ConsumetProvider, IsarProvider>(
      builder: (context, consumetProvider, isarProvider, child) {
        return BouncingWidget(
          scaleFactor: 0.5,
          duration: const Duration(milliseconds: 200),
          onPressed: () {
            _watchEpisode(consumetProvider, isarProvider);
            NavigatorWrapper.push(context, Routes.player);
          },
          child: Container(
            width: double.infinity,
            height: height * 0.115,
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: 170,
                    height: 96,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(episode.image!),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        episode.title ?? 'Episode ${episode.number}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Episode ${episode.number}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _watchEpisode(
      ConsumetProvider consumetProvider, IsarProvider isarProvider) async {
    await consumetProvider.selectEpisode(episode);
    await isarProvider.saveAnimeResult(consumetProvider.selectedAnime!);
    await registerWatchingEpisode(isarProvider, episode);
  }
}
