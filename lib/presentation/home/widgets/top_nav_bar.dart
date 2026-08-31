import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.appIcon,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              AppAssets.appIcon,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem('TV Shows', () {}),
                _buildNavItem('Movies', () {}),
                _buildNavItem('My List', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: ColorResources.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          shadows: [Shadow(color: ColorResources.black, blurRadius: 4)],
        ),
      ),
    );
  }
}
