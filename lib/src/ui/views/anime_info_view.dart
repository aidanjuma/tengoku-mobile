import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/enums/genres.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/utils/info_view_helpers.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/ui/components/pills/genres_pill.dart';
import 'package:tengoku/src/ui/components/tiles/episode_tile.dart';
import 'package:tengoku/src/ui/components/cards/relation_card.dart';
import 'package:tengoku/src/ui/components/sliders/default_slider.dart';

bool bypassWillPopScope = false;

class AnimeInfoView extends StatelessWidget {
  const AnimeInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Consumer<ConsumetProvider>(
      builder: (context, consumetProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (Platform.isIOS || bypassWillPopScope == true) return false;
            await _backtrack(consumetProvider);
            return true;
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            /* Header with Back Arrow */
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.15),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.05,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      bypassWillPopScope = true;
                      _backtrack(consumetProvider);
                      bypassWillPopScope = false;

                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: const Icon(
                        EvaIcons.arrowBack,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Builder(
              builder: (context) {
                AnimeResult selectedAnime = consumetProvider.selectedAnime!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.405,
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            /* Banner BG Image */
                            renderBackgroundImage(height),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                /* Center: Cover Image */
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 150,
                                    height: 212,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          selectedAnime.coverImage!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      /* Padding, Text for Titles (Romaji | Native) & Play Button */
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.0075,
                          horizontal: width * 0.025,
                        ),
                        /* Title(s) & Play Button Column */
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /* Title(s) */
                            Text(
                              selectedAnime.title.romaji ??
                                  consumetProvider
                                      .selectedAnime!.title.userPreferred!,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              selectedAnime.title.native ??
                                  selectedAnime.title.userPreferred!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Zen Maru Gothic',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: colors.onSurface,
                              ),
                            ),
                            /* Play Button */
                            BouncingWidget(
                              scaleFactor: 0.5,
                              duration: const Duration(milliseconds: 200),
                              // TODO: Push to first or nth episode (where relevant).
                              onPressed: () => {},
                              child: Container(
                                width: width * 0.2,
                                height: height * 0.045,
                                margin: EdgeInsets.only(top: height * 0.01),
                                padding: EdgeInsets.only(
                                  left: width * 0.02,
                                  right: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(EvaIcons.arrowRight),
                                    Text(
                                      'Play',
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.035),
                        child: Builder(
                          builder: (context) {
                            // Condition for Rendering:
                            bool consumetIsReady =
                                consumetProvider.isInitialized &&
                                    consumetProvider.isLoading == false &&
                                    consumetProvider.currentAnimeInfo != null;

                            if (consumetIsReady) {
                              AnimeInfo animeInfo =
                                  consumetProvider.currentAnimeInfo!;

                              // Various Data Sources:
                              List<AnimeResult>? relations =
                                  animeInfo.relations!;
                              List<Genres>? genres = animeInfo.genres!;
                              List<AnimeEpisode>? episodes =
                                  animeInfo.episodes!;
                              List<List<AnimeEpisode>>? episodePages =
                                  consumetProvider.episodePages;
                              int selectedEpisodePage =
                                  consumetProvider.selectedEpisodePage;

                              /* Relations, Genres & Episodes List */
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /* Builder: Relations */
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.015),
                                    child: Builder(
                                      builder: (context) {
                                        if (relations.isNotEmpty) {
                                          List<RelationCard> cards =
                                              mapRelationsCards(relations);
                                          /* Relations Widget */
                                          return SizedBox(
                                            width: double.infinity,
                                            height: height * 0.16,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: height * 0.01,
                                                  ),
                                                  child: Text(
                                                    'Relations',
                                                    style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: colors.onSurface,
                                                    ),
                                                  ),
                                                ),
                                                DefaultSlider(
                                                  direction: Axis.horizontal,
                                                  panels: cards,
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                  /* Builder: Genres */
                                  Builder(builder: (context) {
                                    if (genres.isNotEmpty) {
                                      List<GenresPill> pills =
                                          mapGenresPills(genres);
                                      /* Genres Widget */
                                      return SizedBox(
                                        width: double.infinity,
                                        height: height * 0.035,
                                        child: Row(
                                          children: <Widget>[
                                            DefaultSlider(
                                              direction: Axis.horizontal,
                                              panels: pills,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  }),
                                  /* Builder: Episodes List */
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.02),
                                    child: Builder(builder: (context) {
                                      if (episodePages != null) {
                                        List<EpisodeTile> tiles =
                                            mapEpisodeTiles(
                                          episodePages[selectedEpisodePage],
                                        );
                                        /* Episodes List Widget */
                                        return Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                            bottom: height * 0.04,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Episodes',
                                                style: TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: colors.onSurface,
                                                ),
                                              ),
                                              episodePages.length > 1
                                                  ? Container(
                                                      width: double.infinity,
                                                      height: height * 0.035,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: height * 0.01,
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          DefaultSlider(
                                                            direction:
                                                                Axis.horizontal,
                                                            panels:
                                                                mapPagePills(
                                                              episodePages,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                              DefaultSlider(
                                                direction: Axis.vertical,
                                                panels: tiles,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    }),
                                  ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _backtrack(ConsumetProvider consumetProvider) async {
    await consumetProvider.popAnimeFromStack();
  }
}
