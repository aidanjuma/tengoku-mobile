import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:provider/provider.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class RelationCard extends StatelessWidget {
  final AnimeResult relation;
  final EdgeInsets spacing;

  const RelationCard({
    super.key,
    required this.relation,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    /* RELATION:
      If content is unreleased & format is:
        - MediaFormat.music
        - MediaFormat.novel
        - MediaFormat.unknown
      ...disallow tap/route to info.
      ---
      Otherwise, allow route to info.
    */

    if (unsupportedFormats.every((format) => format != relation.format) &&
        unsupportedStatuses.every((status) => status != relation.status)) {
      return Consumer<ConsumetProvider>(
        builder: (context, consumetProvider, child) {
          return BouncingWidget(
            scaleFactor: 0.5,
            duration: const Duration(milliseconds: 200),
            onPressed: () {
              consumetProvider.selectAnimeAndGetInfo(relation);
              selectAnimeOrMangaInfoView(context, relation);
            },
            child: _card(width, height, colors),
          );
        },
      );
    }

    return _card(width, height, colors);
  }

  Widget _card(double width, double height, ColorScheme colors) {
    return Container(
      width: width * 0.6,
      height: height * 0.12,
      margin: spacing,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.012,
        horizontal: width * 0.03,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.onBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 65,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(relation.coverImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: width * 0.325,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        relation.relationType!,
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: colors.primary,
                        ),
                      ),
                      Text(
                        relation.title.romaji ?? relation.title.userPreferred!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${relation.format.toString().split('.').last.toUpperCase()} • ${relation.status.toString().split('.').last.toUpperCase()}',
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
