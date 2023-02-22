import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/providers/isar_provider.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/ui/components/cards/content_card.dart';
import 'package:tengoku/src/ui/components/sliders/default_slider.dart';
import 'package:tengoku/src/ui/components/cards/currently_watching_card.dart';
import 'package:tengoku/src/ui/components/sections/featured_content_section.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      /* Body: Banner BG Image, Basic Info & Cover Image for Featured Content */
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const FeaturedContentSection(
              rating: 86,
              mediaName: 'SPY×FAMILY Part 2',
              bannerImagePath:
                  'assets/images/featured/spy-x-family-part-2-banner.jpg',
              coverImagePath:
                  'assets/images/featured/spy-x-family-part-2-cover.jpg',
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              child: Consumer2<ConsumetProvider, IsarProvider>(
                builder: (context, consumetProvider, isarProvider, child) {
                  // Various Data Sources:
                  List<AnimeResult>? trendingAnime =
                      consumetProvider.trendingAnime;
                  List<AnimeResult>? popularAnime =
                      consumetProvider.popularAnime;
                  List<AnimeEpisode> currentlyWatching =
                      isarProvider.currentlyWatching;

                  // Lists for Card Widgets:
                  List<ContentCard>? trendingAnimeCards;
                  List<ContentCard>? popularAnimeCards;
                  List<CurrentlyWatchingCard>? currentlyWatchingCards;

                  // Conditions for Rendering:
                  bool consumetIsReady = consumetProvider.isLoading == false &&
                      consumetProvider.isInitialized == true;
                  bool isarIsReady = isarProvider.isLoading == false &&
                      isarProvider.isInitialized == true;

                  if (consumetIsReady) {
                    // If not empty, add data to cards in a list & save to variable.
                    trendingAnime != null
                        ? trendingAnimeCards =
                            createContentCardWidgetList(trendingAnime)
                        : null;
                    popularAnime != null
                        ? popularAnimeCards =
                            createContentCardWidgetList(popularAnime)
                        : null;
                  }

                  if (isarIsReady) {
                    currentlyWatching.isNotEmpty
                        ? currentlyWatchingCards =
                            _createCurrentlyWatchingCardWidgetList(
                                currentlyWatching)
                        : null;
                  }

                  /* Trending, Popular & Currently Watching Anime */
                  return Column(
                    children: <Widget>[
                      /* Builder: Trending */
                      Container(
                        margin: EdgeInsets.only(bottom: height * 0.015),
                        child: Builder(
                          builder: (context) {
                            return SizedBox(
                              width: double.infinity,
                              height: height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: height * 0.01,
                                    ),
                                    child: const Text(
                                      'Trending Right Now',
                                      style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  trendingAnimeCards != null && consumetIsReady
                                      ? DefaultSlider(
                                          direction: Axis.horizontal,
                                          panels: trendingAnimeCards,
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      /* Builder: Popular */
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.015),
                        child: Builder(
                          builder: (context) {
                            return SizedBox(
                              width: double.infinity,
                              height: height * 0.2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: height * 0.01,
                                    ),
                                    child: const Text(
                                      'All-Time Popular',
                                      style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  consumetIsReady
                                      ? DefaultSlider(
                                          direction: Axis.horizontal,
                                          panels: popularAnimeCards!,
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      /* Builder: Continue Watching */
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.015),
                        child: Builder(
                          builder: (context) {
                            if (currentlyWatchingCards != null) {
                              return SizedBox(
                                width: double.infinity,
                                height: height * 0.2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                        bottom: height * 0.01,
                                      ),
                                      child: const Text(
                                        'Continue Watching',
                                        style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    isarIsReady
                                        ? DefaultSlider(
                                            direction: Axis.horizontal,
                                            panels: currentlyWatchingCards,
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CurrentlyWatchingCard> _createCurrentlyWatchingCardWidgetList(
      List<AnimeEpisode> data) {
    List<CurrentlyWatchingCard> cards = [];
    for (int i = 0; i < data.length; i++) {
      cards.add(
        CurrentlyWatchingCard(
          episode: data[i],
          spacing: i < data.length
              ? const EdgeInsets.only(right: 12)
              : const EdgeInsets.only(left: 12),
        ),
      );
    }
    return cards;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ConsumetProvider consumet =
          Provider.of<ConsumetProvider>(context, listen: false);
      IsarProvider isar = Provider.of<IsarProvider>(context, listen: false);

      // Get trending anime from Consumet with default config:
      await consumet.getTrendingAnime(null, null);
      // Get popular anime from Consumet with default config:
      await consumet.getPopularAnime(null, null);
      // Get list of anime episodes currently being watched by the user:
      await isar.getListOfCurrentlyWatching();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
