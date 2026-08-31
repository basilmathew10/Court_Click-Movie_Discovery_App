import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';

class PreviewItem {
  final String imageUrl;

  const PreviewItem({required this.imageUrl});
}

class PreviewsSection extends StatelessWidget {
  final List<PreviewItem> previews;

  static const List<PreviewItem> defaultPreviews = [
    PreviewItem(
      imageUrl:
          'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    ),
    PreviewItem(
      imageUrl:
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    ),
    PreviewItem(
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    ),
    PreviewItem(
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    ),
    PreviewItem(
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  const PreviewsSection({super.key, this.previews = defaultPreviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Previews',
            style: TextStyle(
              color: ColorResources.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
        ),
        gap12,
        SizedBox(
          height: 125,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: previews.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final item = previews[index];
              return _buildPreviewCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewCard(PreviewItem item) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          width: 105,
          height: 105,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Icon(
                    Icons.person,
                    color: ColorResources.grey,
                    size: 40,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
