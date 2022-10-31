import 'package:flutter/material.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class SearchResultTile extends StatelessWidget {
  final AnimeResult result;

  const SearchResultTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      child: Container(),
      onPressed: () => {},
    );
  }
}
