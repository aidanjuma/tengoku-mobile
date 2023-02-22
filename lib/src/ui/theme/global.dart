import 'package:flutter/material.dart';

class Themes {
  // Consistent Colors:
  static const primaryColor = Color(0xff76a1fa);
  static const errorColor = Color(0xb3ff6961);
  static const pureWhite = Color(0xffffffff);

  // Other Colors:
  static const ff1c2128 = Color(0xff1c2128);
  static const ff22272e = Color(0xff22272e);
  static const ff24292f = Color(0xff24292f);
  static const ff2d333b = Color(0xff2d333b);
  static const ff373e47 = Color(0xff373e47);
  static const ff52565a = Color(0xff52565a);
  static const ffadbac7 = Color(0xffadbac7);
  static const ffd0d7de = Color(0xffd0d7de);
  static const ffd8dee4 = Color(0xffd8dee4);
  static const fff6f8fa = Color(0xfff6f8fa);

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: fff6f8fa,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: ff24292f,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: ffd8dee4,
      secondary: ffd0d7de,
      onSecondary: pureWhite,
      error: errorColor,
      onError: pureWhite,
      background: fff6f8fa,
      onBackground: ffd8dee4,
      surface: ffd8dee4,
      onSurface: ff52565a,
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ff22272e,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: fff6f8fa,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: ff373e47,
      secondary: ff22272e,
      onSecondary: ff2d333b,
      error: errorColor,
      onError: pureWhite,
      background: ff1c2128,
      onBackground: ff2d333b,
      surface: ff2d333b,
      onSurface: ffadbac7,
    ),
  );
}
