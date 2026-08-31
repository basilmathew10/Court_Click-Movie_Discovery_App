import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/extentions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600; // Tablet breakpoint
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    // Responsive sizing
    final containerHeight = (isTablet ? 64.0 : 60.0) + bottomPadding;
    final iconSize = isTablet ? 26.0 : 22.0;
    final fontSize = isTablet ? 12.0 : 10.60;

    final items = [
      {
        'icon': AppAssets.home,
        'activeIcon': AppAssets.homeActive,
        'label': 'Home',
      },
      {
        'icon': AppAssets.search,
        'activeIcon': AppAssets.searchActive,
        'label': 'Search',
      },
      {
        'icon': AppAssets.comingSoon,
        'activeIcon': AppAssets.comingSoonActive,
        'label': 'Coming Soon',
      },
      {
        'icon': AppAssets.downloads,
        'activeIcon': AppAssets.downloadsActive,
        'label': 'Downloads',
      },
      {
        'icon': AppAssets.more,
        'activeIcon': AppAssets.moreActive,
        'label': 'More',
      },
    ];

    return Container(
      height: containerHeight,
      color: ColorResources.navBarColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = selectedIndex == index;
            final isComingSoon = index == 2 || item['label'] == 'Coming Soon';

            return Expanded(
              child: GestureDetector(
                onTap: () => onItemSelected(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: iconSize,
                          width: iconSize,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: SvgPicture.asset(
                              isSelected ? item['activeIcon']! : item['icon']!,
                              key: ValueKey<bool>(isSelected),
                              height: iconSize,
                              width: iconSize,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        if (isComingSoon)
                          Positioned(
                            top: -5,
                            right: -7,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: ColorResources.secondary,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                              ),
                              child: const Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    gap4,
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      style: context.textStyle1.copyWith(
                        fontSize: fontSize,
                        color: isSelected
                            ? ColorResources.white
                            : ColorResources.grey,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                      child: Text(
                        item['label']!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
