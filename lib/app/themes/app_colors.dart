import 'package:flutter/material.dart';

class AppColors {
  // Define static colors
  static const Color primary = Color(0xFFC1EBFF);
  static const Color primary600 = Color(0xFF35BAF8);
  static const Color lightIntensity = Color(0xFF65B5DB);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondary200 = Color(0xFFEEE1F5);
  static const Color secondary400 = Color(0xFFBAA1C8);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color error = Color(0xFFB00020);
  static const Color neutral500 = Color(0xFFADB5BD);
  static const Color neutral200 = Color(0xFFE9ECEF);
  static const Color childCare = Color(0xFF8AB58A);
  static const Color childCare100 = Color(0xFFD8F7DF);
  static const Color highIntensity = Color(0xFFFFEAD1);
  static const Color highIntensity100 = Color(0xFFDC974F);
  static const Color yellow100 = Color(0xFFFBF2C0);

  static const Map<int, Color> _steelBlueColorMap = {
    50: Color.fromRGBO(63, 125, 178, .1),
    100: Color.fromRGBO(63, 125, 178, .2),
    200: Color.fromRGBO(63, 125, 178, .3),
    300: Color.fromRGBO(63, 125, 178, .4),
    400: Color.fromRGBO(63, 125, 178, .5),
    500: Color.fromRGBO(63, 125, 178, .6),
    600: Color.fromRGBO(63, 125, 178, .7),
    700: Color.fromRGBO(63, 125, 178, .8),
    800: Color.fromRGBO(63, 125, 178, .9),
    900: Color.fromRGBO(63, 125, 178, 1),
  };

  static const MaterialColor materialSteelBlue = MaterialColor(0xFF3F7DB2, _steelBlueColorMap);
}
