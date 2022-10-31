import 'package:flutter/material.dart';

class ContentSlider extends StatelessWidget {
  final Axis direction;
  final List<Widget> panels;

  const ContentSlider({
    super.key,
    required this.direction,
    required this.panels,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: panels.length,
        scrollDirection: direction,
        itemBuilder: (context, index) {
          return panels[index];
        },
      ),
    );
  }
}
