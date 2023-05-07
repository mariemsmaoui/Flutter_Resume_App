import 'package:flutter/material.dart';
import 'package:cv/core/color/colors.dart';
import 'package:flutter/scheduler.dart';

class AppTheme {
  // returns a ThemeData object : dark or light.
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }
}

class ThemeColors {
  const ThemeColors._();
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
     primaryColor: primaryColor,
      backgroundColor: lightBackgroundColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackgroundColor,
      ),
      textTheme: TextTheme(button: TextStyle(color: lightTextColor)));

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    backgroundColor: darkBackgroundColor,
    scaffoldBackgroundColor: const Color(0xFF00040F),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      button: TextStyle(color: darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
    ),
  );
  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);
  //
  Color get textColor => brightness == Brightness.light
      ? const Color(0xFF403930)
      : const Color(0xFFFFF8F2);
  //
  Color get secondaryColor => const Color(0xFF171616);
  //
  Gradient get serviceCard =>
      brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;
}
