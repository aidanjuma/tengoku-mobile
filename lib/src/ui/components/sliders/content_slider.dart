import 'package:flutter/material.dart';

class ContentSlider extends StatelessWidget {
  final List<Widget> cards;

  const ContentSlider({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: cards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return cards[index];
        },
      ),
    );
  }
}
