import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin OrientationManagerMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _forceLandscapeMode();
    return const SizedBox.shrink();
  }

  @override
  void dispose() {
    _forcePortraitMode();
    super.dispose();
  }
}

void _forcePortraitMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

void _forceLandscapeMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
