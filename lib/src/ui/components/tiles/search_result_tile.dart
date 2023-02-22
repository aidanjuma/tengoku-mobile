import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/utils/info_view_helpers.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class SearchResultTile extends StatelessWidget {
  final AnimeResult result;
  final EdgeInsets spacing;

  const SearchResultTile({
    super.key,
    required this.result,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Consumer<ConsumetProvider>(
      builder: (context, consumetProvider, child) {
        return BouncingWidget(
          scaleFactor: 0.25,
          duration: const Duration(milliseconds: 100),
          onPressed: () {
            loadAnimeInfo(consumetProvider, result);
            selectAnimeOrMangaInfoView(context, result);
          },
          child: Container(
            margin: spacing,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 142,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(result.coverImage!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.25),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              result.title.userPreferred ??
                                  result.title.romaji!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      result.title.native != null
                          ? Text(
                              result.title.native!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Zen Maru Gothic',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: colors.onSurface,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
