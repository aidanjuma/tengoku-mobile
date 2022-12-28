import 'package:flutter/material.dart';
import 'package:tengoku/src/utils/orientation.dart';

mixin EnforceRequiredOrientation<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    forceLandscapeMode();
    return const SizedBox.shrink();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    forcePortraitMode();
    super.dispose();
  }
}
