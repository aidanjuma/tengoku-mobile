import 'package:flutter/material.dart';
import 'package:tengoku/src/utils/orientation.dart';

// Mainly for hot reload - corrects orientation upon leaving player at restart.

mixin ForcePortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    forcePortraitMode();
    return const SizedBox.shrink();
  }
}
