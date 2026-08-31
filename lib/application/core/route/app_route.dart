import 'package:court_click_movie_dicovery_app/application/core/app_details.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/logger.dart';
import 'package:court_click_movie_dicovery_app/presentation/initial_screen/user_selection_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.logWarning(
      'Route Name: ${settings.name},  Arguments: ${settings.arguments}, ArgumentType: ${settings.arguments.runtimeType}',
    );
    final arguments = (settings.arguments as Map<String, dynamic>?);

    switch (settings.name) {
      case UserSelectionScreen.routeName:
        return pushRoute(settings, const UserSelectionScreen());

      case SplashScreen.routeName:
      default:
        return pushRoute(settings, const SplashScreen());
    }
  }

  static Route<dynamic> pushRoute(RouteSettings settings, Widget screen) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 150),
      reverseTransitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Defines the starting point (Right off screen) to ending point (Center screen)
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeIn));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return AppDetails.globalNavigatorKey.currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Generic pushReplacementNamed method
  static Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) {
    return AppDetails.globalNavigatorKey.currentState!
        .pushReplacementNamed<T, TO>(routeName, arguments: arguments);
  }

  /// Generic pushNamedAndRemoveUntil method
  static Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return AppDetails.globalNavigatorKey.currentState!
        .pushNamedAndRemoveUntil<T>(
          routeName,
          predicate ?? (_) => false, // Default removes all previous routes
          arguments: arguments,
        );
  }

  /// Generic pop method
  static void pop<T>([T? result]) {
    AppDetails.globalNavigatorKey.currentState!.pop<T>(result);
  }

  /// Generic popUntil method
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    AppDetails.globalNavigatorKey.currentState!.popUntil(predicate);
  }

  /// Pop Until + Refresh Route With Arguments
  static void popUntilAndReplaceWithArgs(
    bool Function(Route<dynamic>) predicate,
    Object? arguments,
  ) {
    final navigator = AppDetails.globalNavigatorKey.currentState!;

    navigator.popUntil(predicate);

    // Now replace the top-most route with arguments
    navigator.pushReplacementNamed(
      SplashScreen.routeName,
      arguments: arguments,
    );
  }
}
