import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/enums/genres.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/ui/components/sliders/content_slider.dart';
import 'package:tengoku/src/ui/components/panels/pills/genres_pill.dart';
import 'package:tengoku/src/ui/components/panels/tiles/episode_tile.dart';
import 'package:tengoku/src/ui/components/panels/cards/relation_card.dart';

class AnimeInfoView extends StatefulWidget {
  const AnimeInfoView({super.key});

  @override
  State<AnimeInfoView> createState() => _AnimeInfoViewState();
}

class _AnimeInfoViewState extends State<AnimeInfoView> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Consumer<ConsumetProvider>(
      builder: (context, consumetProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            consumetProvider.infoViewCacheStack.queue.length > 1
                ? consumetProvider.replaceAnimeInfoWithPrevious()
                : null;
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
                    onTap: () => Navigator.pop(context),
                    child: const Icon(EvaIcons.arrowBack),
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
                            _renderBackgroundImage(height),
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
                                          List<RelationCard> cards = [];
                                          /* Map n relation(s) to n RelationCard(s) */
                                          for (int i = 0;
                                              i < relations.length;
                                              i++) {
                                            final relation = relations[i];
                                            cards.add(
                                              RelationCard(
                                                relation: relation,
                                                spacing: i < relations.length
                                                    ? const EdgeInsets.only(
                                                        right: 12)
                                                    : const EdgeInsets.only(
                                                        left: 12),
                                              ),
                                            );
                                          }
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
                                                ContentSlider(
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
                                      List<GenresPill> pills = [];
                                      /* Map n genre(s) to n GenresPill(s) */
                                      for (int i = 0; i < genres.length; i++) {
                                        final genre = genres[i];
                                        pills.add(
                                          GenresPill(
                                            genre: genre,
                                            spacing: i < genres.length
                                                ? const EdgeInsets.only(
                                                    right: 8)
                                                : const EdgeInsets.only(
                                                    left: 8),
                                          ),
                                        );
                                      }
                                      /* Genres Widget */
                                      return SizedBox(
                                        width: double.infinity,
                                        height: height * 0.035,
                                        child: Row(
                                          children: <Widget>[
                                            ContentSlider(
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
                                      if (episodes.isNotEmpty) {
                                        List<EpisodeTile> tiles = [];
                                        /* Map n episode(s) to n EpisodeTile(s) */
                                        for (int i = 0;
                                            i < episodes.length;
                                            i++) {
                                          final episode = episodes[i];
                                          tiles.add(
                                              EpisodeTile(episode: episode));
                                        }
                                        /* Episodes List Widget */
                                        return SizedBox(
                                          width: double.infinity,
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
                                                  'Episodes',
                                                  style: TextStyle(
                                                    fontFamily: 'Lexend',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: colors.onSurface,
                                                  ),
                                                ),
                                              ),
                                              ContentSlider(
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

  Widget _renderBackgroundImage(double height) {
    return Consumer<ConsumetProvider>(
      builder: (context, consumetProvider, child) {
        String? image = consumetProvider.selectedAnime!.bannerImage;
        // Should theoretically always have cover image; fallback if no bannerImage.
        image ??= consumetProvider.selectedAnime!.coverImage;
        return Container(
          width: double.infinity,
          height: height * 0.355,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
