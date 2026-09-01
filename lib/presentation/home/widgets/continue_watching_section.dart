import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';

class ContinueWatchingItem {
  final String title;
  final String imageUrl;
  final double progress;

  const ContinueWatchingItem({
    required this.title,
    required this.imageUrl,
    required this.progress,
  });
}

class ContinueWatchingSection extends StatelessWidget {
  final String title;
  final List<ContinueWatchingItem> items;

  static const List<ContinueWatchingItem> defaultItems = [
    ContinueWatchingItem(
      title: "NIGHT",
      imageUrl:
          'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
      progress: 0.65,
    ),
    ContinueWatchingItem(
      title: "FAMILY",
      imageUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
      progress: 0.40,
    ),
    ContinueWatchingItem(
      title: "RIVER",
      imageUrl:
          'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400&auto=format&fit=crop',
      progress: 0.85,
    ),
    ContinueWatchingItem(
      title: "HUNTER",
      imageUrl:
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
      progress: 0.25,
    ),
  ];

  const ContinueWatchingSection({
    super.key,
    this.title = 'Continue Watching for Emenalo',
    this.items = defaultItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              color: ColorResources.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
        ),
        gap12,
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(ContinueWatchingItem item) {
    return Container(
      width: 115,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          // Poster Image + Progress Bar
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container(
                        color: const Color(0xFF2C2C2C),
                        child: const Icon(
                          Icons.movie,
                          color: ColorResources.grey,
                        ),
                      );
                    },
                  ),
                ),
                // Progress Bar at Bottom of Image
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LinearProgressIndicator(
                    value: item.progress,
                    backgroundColor: Colors.white24,
                    color: ColorResources.secondary,
                    minHeight: 3,
                  ),
                ),
              ],
            ),
          ),

          // Bottom Action Bar (Info & More Vert Icons)
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: ColorResources.navBarColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(2)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.info_outline, color: ColorResources.white, size: 20),
                gap8,
                Icon(Icons.more_vert, color: ColorResources.white, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
