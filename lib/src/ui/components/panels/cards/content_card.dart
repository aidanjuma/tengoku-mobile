import 'package:flutter/material.dart';
import 'package:tengoku/src/utils/global.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class ContentCard extends StatelessWidget {
  final AnimeResult result;
  final EdgeInsets spacing;

  const ContentCard({
    super.key,
    required this.result,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      scaleFactor: 0.5,
      duration: const Duration(milliseconds: 50),
      onPressed: () => pushToInfoView(context, result),
      child: Container(
        width: 100,
        height: 142,
        margin: spacing,
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
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 8,
          ),
          child: Text(
            result.title.userPreferred ?? result.title.romaji!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
