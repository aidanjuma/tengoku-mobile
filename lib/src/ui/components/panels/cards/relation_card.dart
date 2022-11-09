import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:tengoku/src/types/media_format.dart';
import 'package:tengoku/src/models/anime_result.dart';

class RelationCard extends StatelessWidget {
  final AnimeResult relation;

  const RelationCard({super.key, required this.relation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // If manga, is pressable & routes to info page (latter is TODO)...
    if (relation.format == MediaFormat.manga) {
      return BouncingWidget(
        scaleFactor: 0.5,
        duration: const Duration(milliseconds: 50),
        onPressed: () => {},
        child: _card(width, height, colors.onSurface),
      );
    }

    // ...otherwise, just viewable.
    return _card(width, height, colors.onSurface);
  }

  Widget _card(double width, double height, Color cardColor) {
    return Container(
      width: width * 0.48,
      height: height * 0.12,
      color: cardColor,
    );
  }
}
