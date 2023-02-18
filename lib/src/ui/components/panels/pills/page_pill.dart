import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class PagePill extends StatelessWidget {
  final int id;
  final int lowerBound;
  final int upperBound;
  final EdgeInsets spacing;

  const PagePill({
    super.key,
    required this.id,
    required this.lowerBound,
    required this.upperBound,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsumetProvider>(
      builder: (context, consumetProvider, child) {
        return GestureDetector(
          onTap: () async =>
              await consumetProvider.updateSelectedEpisodePage(id),
          child: Container(
            margin: spacing,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Center(
              child: Text(
                '$lowerBound-$upperBound',
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
