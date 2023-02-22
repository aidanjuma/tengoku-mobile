import 'package:flutter/material.dart';

class DefaultSlider extends StatelessWidget {
  final Axis direction;
  final List<Widget> panels;

  const DefaultSlider({
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
