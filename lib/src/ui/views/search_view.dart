import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/utils/debouncer.dart';
import 'package:tengoku/src/enums/media_status.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/ui/components/sliders/default_slider.dart';
import 'package:tengoku/src/ui/components/tiles/search_result_tile.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.2),
        child: Container(
          margin: EdgeInsets.only(
            top: height * 0.075,
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.035,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(EvaIcons.search),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (query) => _updateSearchResults(
                      query,
                      null,
                      null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Consumer<ConsumetProvider>(builder: (context, provider, child) {
          List<AnimeResult>? animeResults = provider.animeResults;

          if (animeResults != null) {
            List<SearchResultTile> tiles = [];
            // Map each result to a SearchResultTile, unless not yet released.
            for (int i = 0; i < animeResults.length; i++) {
              final result = animeResults[i];
              if (result.status != MediaStatus.notYetAired) {
                tiles.add(
                  SearchResultTile(
                    result: result,
                    spacing: const EdgeInsets.symmetric(vertical: 12),
                  ),
                );
              }
            }

            return Column(
              children: <Widget>[
                DefaultSlider(
                  direction: Axis.vertical,
                  panels: tiles,
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }

  void _updateSearchResults(String query, int? page, int? resultsPerPage) {
    _debouncer.run(
      () async {
        final consumetProvider =
            Provider.of<ConsumetProvider>(context, listen: false);
        // Only fire request if query is different than last time.
        if (consumetProvider.latestQuery != query) {
          await consumetProvider.basicAnimeSearch(query, page, resultsPerPage);
        }
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
