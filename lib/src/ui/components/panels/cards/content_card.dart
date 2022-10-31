import 'package:flutter/material.dart';
import 'package:tengoku/src/types/item_title.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class ContentCard extends StatelessWidget {
  final String anilistId;
  final ItemTitle title;
  final EdgeInsets spacing;
  final String? coverImageUrl;

  const ContentCard({
    super.key,
    required this.anilistId,
    required this.title,
    required this.spacing,
    this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      scaleFactor: 0.5,
      duration: const Duration(milliseconds: 50),
      child: Container(
        width: 100,
        height: 142,
        margin: spacing,
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
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 8,
          ),
          child: Text(
            title.userPreferred ?? title.romaji!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ),
      ),
      // TODO: Navigate to Page...
      onPressed: () => {},
    );
  }
}
