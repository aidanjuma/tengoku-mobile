import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin ForcePortraitMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _forcePortraitMode();
    return const SizedBox.shrink();
  }
}

mixin ForceLandscapeStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _forceLandscapeMode();
    return const SizedBox.shrink();
  }

  @override
  void dispose() {
    _enableRotation();
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

void _enableRotation() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}
