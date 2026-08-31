import 'package:court_click_movie_dicovery_app/application/core/app_details.dart';
import 'package:court_click_movie_dicovery_app/application/core/route/app_route.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/app_theme.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/theme/theme_cubit.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/domain/core/di/injection.dart';
import 'package:court_click_movie_dicovery_app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  try {
    await configureDependency(env: Environment.dev);
  } catch (e) {
    debugPrint('Error initializing dependencies: $e');
  }
  runApp(const SafeArea(bottom: true, top: false, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                navigatorKey: AppDetails.globalNavigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Netflix - A Movie Discovery App',
                onGenerateRoute: AppRoute.onGenerateRoute,
                initialRoute: SplashScreen.routeName,
                theme: AppTheme.getTheme(AppThemeMode.dark),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: Stack(children: [child!, const DropdownAlert()]),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
