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

  // static PinTheme get defaultPinTheme => PinTheme(
  //       // width: 70,
  //       // height: 70,
  //       margin: const EdgeInsets.all(1),
  //       textStyle: const TextStyle(
  //         fontSize: 20,
  //         color: ColorResources.textColor,
  //
  //         fontWeight: FontWeight.w600,
  //       ),
  //       decoration: BoxDecoration(
  //         color: ColorResources.secondary,
  //         border: Border.all(
  //           color: ColorResources.secondary,
  //         ),
  //         borderRadius: BorderRadius.circular(16),

  //       ),
  //     );

  // static PinTheme get focusedPinTheme => defaultPinTheme.copyDecorationWith(
  //       border: Border.all(color: ColorResources.secondary),
  //       borderRadius: BorderRadius.circular(16),
  //     );

  // static PinTheme get submittedPinTheme => defaultPinTheme.copyWith(
  //       decoration: defaultPinTheme.decoration?.copyWith(
  //         color: ColorResources.secondary,
  //       ),
  //     );
}
