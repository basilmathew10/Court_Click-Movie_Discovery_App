import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/text_styles.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return _darkTheme;
      case AppThemeMode.light:
        return _lightTheme;
    }
  }

  static ThemeData get _lightTheme => ThemeData(
    fontFamily: sfProFontFamily,
    fontFamilyFallback: sfProFontFamilyFallback,
    scaffoldBackgroundColor: ColorResources.scaffoldBackground,
    textTheme: TextTheme(
      bodyMedium: baseTextStyle,
      headlineSmall: baseHeadingStyle,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

  static ThemeData get _darkTheme => ThemeData(
    fontFamily: sfProFontFamily,
    fontFamilyFallback: sfProFontFamilyFallback,
    scaffoldBackgroundColor: ColorResources.scaffoldBackground,
    textTheme: TextTheme(
      bodyMedium: baseTextStyle,
      headlineSmall: baseHeadingStyle,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

  static ThemeData get _premiumTheme => ThemeData(
    fontFamily: sfProFontFamily,
    fontFamilyFallback: sfProFontFamilyFallback,
    scaffoldBackgroundColor: ColorResources.scaffoldBackground,
    textTheme: TextTheme(
      bodyMedium: baseTextStyle,
      headlineSmall: baseHeadingStyle,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}
