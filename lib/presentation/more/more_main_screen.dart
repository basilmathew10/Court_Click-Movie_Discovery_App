import 'package:court_click_movie_dicovery_app/application/core/route/app_route.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/alert_dialog.dart';
import 'package:court_click_movie_dicovery_app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';
import 'package:court_click_movie_dicovery_app/presentation/more/widgets/profile_selector_widget.dart';
import 'package:court_click_movie_dicovery_app/presentation/more/widgets/referral_card_widget.dart';

class MoreMainScreen extends StatelessWidget {
  const MoreMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gap16,
              // Top Profile Selector Section
              const ProfileSelectorWidget(),
              gap24,

              // Referral Card: Tell friends about Netflix
              ReferralCardWidget(
                onCopyLinkTap: () {
                  CustomAlertDialog.showCustomDialog(
                    title: 'Referral Code',
                    subtitle: 'Link Copied Successfully',
                  );
                },
              ),
              gap12,

              // My List Row with SVG Tick Icon
              _buildMenuItemTile(
                iconAsset: AppAssets.tick,
                label: 'My List',
                onTap: () {},
              ),
              const Divider(color: Colors.white12, height: 1),

              // Navigation List Options
              _buildSimpleMenuItem('App Settings', onTap: () {}),
              _buildSimpleMenuItem('Account', onTap: () {}),
              _buildSimpleMenuItem('Help', onTap: () {}),
              _buildSimpleMenuItem(
                'Sign Out',
                onTap: () {
                  AppRoute.pushNamedAndRemoveUntil(SplashScreen.routeName);
                },
              ),

              gap48,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemTile({
    required String iconAsset,
    required String label,
    VoidCallback? onTap,
  }) {
    return Container(
      color: ColorResources.black,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: SvgPicture.asset(
          iconAsset,
          height: 20,
          width: 20,
          fit: BoxFit.contain,
        ),
        title: Text(
          label,
          style: const TextStyle(
            color: ColorResources.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleMenuItem(String label, {VoidCallback? onTap}) {
    return Container(
      color: ColorResources.black,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        title: Text(
          label,
          style: const TextStyle(
            color: ColorResources.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
