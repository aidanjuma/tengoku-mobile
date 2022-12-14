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
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: panels.length,
        padding: EdgeInsets.zero,
        scrollDirection: direction,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return panels[index];
        },
      ),
    );
  }
}
