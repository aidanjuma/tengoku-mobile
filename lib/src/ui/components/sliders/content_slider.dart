import 'package:flutter/material.dart';

class ContentSlider extends StatelessWidget {
  final Axis direction;
  final List<Widget> cards;

  const ContentSlider({
    super.key,
    required this.direction,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: cards.length,
        scrollDirection: direction,
        itemBuilder: (context, index) {
          return cards[index];
        },
      ),
    );
  }
}
