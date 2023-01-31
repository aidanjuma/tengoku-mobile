import 'package:flutter/material.dart';
import 'package:tengoku/src/enums/genres.dart';
import 'package:tengoku/src/utils/global.dart';

class GenresPill extends StatelessWidget {
  final Genres genre;
  final EdgeInsets spacing;

  const GenresPill({
    super.key,
    required this.genre,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: spacing,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.onBackground,
      ),
      child: Center(
        child: Text(
          genreToString[genre]!,
          style: const TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
