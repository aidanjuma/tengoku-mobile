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
    return BouncingWidget(
      scaleFactor: 0.25,
      duration: const Duration(milliseconds: 50),
      child: Container(
        margin: spacing,
        child: Row(
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
          ],
        ),
      ),
      onPressed: () => {},
    );
  }
}
