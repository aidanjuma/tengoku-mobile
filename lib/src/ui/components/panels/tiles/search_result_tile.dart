import 'package:flutter/material.dart';
import 'package:tengoku/src/types/item_title.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class SearchResultTile extends StatelessWidget {
  final String anilistId;
  final ItemTitle title;
  final EdgeInsets spacing;
  final String? coverImageUrl;

  const SearchResultTile({
    super.key,
    required this.anilistId,
    required this.title,
    required this.spacing,
    required this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BouncingWidget(
      scaleFactor: 0.25,
      duration: const Duration(milliseconds: 50),
      child: Container(
        margin: spacing,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(coverImageUrl!),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title.userPreferred ?? title.romaji!,
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
                  title.native != null
                      ? Text(
                          title.native!,
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
      onPressed: () => {},
    );
  }
}
