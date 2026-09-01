import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';

class MainHeroCard extends StatelessWidget {
  final String imageUrl;
  final String rankingText;
  final VoidCallback? onPlayPressed;
  final VoidCallback? onMyListPressed;
  final VoidCallback? onInfoPressed;

  const MainHeroCard({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1000&auto=format&fit=crop',
    this.rankingText = '#2 in Nigeria Today',
    this.onPlayPressed,
    this.onMyListPressed,
    this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight * 0.51;

    return Stack(
      children: [
        // Background Hero Poster Image
        Container(
          height: heroHeight,
          width: double.infinity,
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black45,
                ColorResources.transparent,
                Colors.black54,
                ColorResources.black,
              ],
              stops: [0.0, 0.25, 0.75, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2C1810), Color(0xFF101010)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.movie_filter_rounded,
                    color: ColorResources.grey,
                    size: 80,
                  ),
                ),
              );
            },
          ),
        ),

        // Hero Content Overlay (Rank Badge & Action Buttons)
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top 10 Rank Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorResources.white,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'TOP\n10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorResources.white,
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                        height: 0.9,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    rankingText,
                    style: const TextStyle(
                      color: ColorResources.white,
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              gap16,

              // Action Buttons Row (My List, Play, Info)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // My List Button
                  _buildActionButton(
                    icon: Icons.add,
                    label: 'My List',
                    onTap: onMyListPressed,
                  ),

                  // Play Button
                  GestureDetector(
                    onTap: onPlayPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: ColorResources.secondaryGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: ColorResources.black,
                            size: 40,
                          ),
                          gap12,
                          Text(
                            'Play',
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Info Button
                  _buildActionButton(
                    icon: Icons.info_outline,
                    label: 'Info',
                    onTap: onInfoPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ColorResources.white, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: ColorResources.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
