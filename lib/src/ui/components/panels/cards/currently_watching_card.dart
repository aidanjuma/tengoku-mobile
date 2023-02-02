import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/router/routes.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/providers/isar_provider.dart';
import 'package:tengoku/src/router/navigator_wrapper.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class CurrentlyWatchingCard extends StatelessWidget {
  final AnimeEpisode episode;
  final EdgeInsets spacing;

  const CurrentlyWatchingCard({
    super.key,
    required this.episode,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Consumer2<ConsumetProvider, IsarProvider>(
      builder: (context, consumetProvider, isarProvider, child) {
        return BouncingWidget(
          scaleFactor: 0.5,
          duration: const Duration(milliseconds: 50),
          onPressed: () {
            isarProvider.setCurrentAnimeIfStored(episode.parentIsarId!);
            consumetProvider.selectAnimeAndGetInfo(isarProvider.currentAnime!);
            consumetProvider.selectEpisode(episode);
            registerWatchingEpisode(isarProvider, episode);
            NavigatorWrapper.push(context, Routes.player);
          },
          child: Container(
            width: width * 0.49,
            margin: spacing,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(episode.image!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'EP ${episode.number}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      color: Color(0xffdadada),
                    ),
                  ),
                  Text(
                    episode.title ?? 'Episode ${episode.number}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 4,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xff22272e),
                            ),
                            Container(
                                width: episode.amountWatched *
                                    constraints.maxWidth,
                                color: const Color(0xffbb5350)),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
