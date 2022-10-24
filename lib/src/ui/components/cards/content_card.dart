import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String? coverImageUrl;

  const ContentCard({
    super.key,
    required this.title,
    this.coverImageUrl,
  });

  // TODO: Card UI, Navigate to Page...
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      child: Container(),
      onPressed: () => {},
    );
  }
}
