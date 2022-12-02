import 'package:flutter/services.dart';

void forcePortraitMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

void forceLandscapeMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
