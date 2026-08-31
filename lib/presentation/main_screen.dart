import 'package:court_click_movie_dicovery_app/application/home/home_bloc.dart';
import 'package:court_click_movie_dicovery_app/presentation/coming_soon/coming_soon_main_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/downloads/download_main_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/home_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/more/more_main_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/search/search_main_screen.dart';
import 'package:court_click_movie_dicovery_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';

class MainScreen extends StatefulWidget {
  final int? initialIndex;

  const MainScreen({super.key, this.initialIndex});
  static const routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;
  DateTime? _lastBackPressTime;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex ?? 0;

    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    scaffoldKey.currentState!.closeDrawer();
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool _handleBackPress() {
    final now = DateTime.now();
    final screenWidth = MediaQuery.of(context).size.width;

    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;

      // Show an improved professional snackbar with logo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo, width: 16, height: 16),
              const SizedBox(width: 12),
              const Text(
                'Press back again to exit Netflix',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorResources.black,
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ColorResources.white,
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.06,
            left: screenWidth * 0.099, // 7.5% margin on each side (15% total)
            right: screenWidth * 0.099,
          ),
          elevation: 4,
        ),
      );

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const _KeepAliveWrapper(child: HomeScreen()),
      const _KeepAliveWrapper(child: SearchMainScreen()),
      const _KeepAliveWrapper(child: ComingSoonMainScreen()),
      const _KeepAliveWrapper(child: DownloadMainScreen()),
      const _KeepAliveWrapper(child: MoreMainScreen()),
    ];

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) return;

            // If not on home screen (index 0), navigate to home screen
            if (selectedIndex == 1 ||
                selectedIndex == 2 ||
                selectedIndex == 3) {
              setState(() {
                selectedIndex = 0;
              });
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return;
            }

            // If on home screen (index 0), handle app exit
            final shouldPop = _handleBackPress();
            if (shouldPop) {
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            key: scaffoldKey,
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: selectedIndex,
              onItemSelected: onItemTapped,
            ),
          ),
        );
      },
    );
  }
}

class _KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const _KeepAliveWrapper({required this.child});

  @override
  State<_KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<_KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
