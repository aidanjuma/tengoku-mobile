import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';

// 🙏 https://github.com/quango2304/android_navigation_mode
class AndroidNavigationMode {
  static const MethodChannel _channel =
      MethodChannel('android_navigation_mode');

  static Future<DeviceNavigationMode> get getNavigationMode async {
    if (Platform.isIOS) {
      return DeviceNavigationMode.none;
    }

    final int mode = await _channel.invokeMethod('get_navigation_mode');
    switch (mode) {
      case 0:
        return DeviceNavigationMode.threeButton;
      case 1:
        return DeviceNavigationMode.twoButton;
      case 2:
        return DeviceNavigationMode.fullScreenGesture;
      default:
        return DeviceNavigationMode.none;
    }
  }
}

enum DeviceNavigationMode { twoButton, threeButton, fullScreenGesture, none }
