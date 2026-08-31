import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';

class NewArrivalItem {
  final String title;
  final String imageUrl;
  final String date;

  const NewArrivalItem({
    required this.title,
    required this.imageUrl,
    required this.date,
  });
}

class ComingSoonNotificationsWidget extends StatelessWidget {
  final List<NewArrivalItem> items;

  static const List<NewArrivalItem> defaultItems = [
    NewArrivalItem(
      title: 'El Chapo',
      imageUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
      date: 'Nov 6',
    ),
    NewArrivalItem(
      title: 'Peaky Blinders',
      imageUrl:
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
      date: 'Nov 6',
    ),
  ];

  const ComingSoonNotificationsWidget({super.key, this.items = defaultItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Red Bell Icon + Notifications Title
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 8,
            bottom: 14,
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: ColorResources.secondary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications,
                  color: ColorResources.white,
                  size: 16,
                ),
              ),
              gap12,
              const Text(
                'Notifications',
                style: TextStyle(
                  color: ColorResources.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),

        // New Arrivals List Container
        Container(
          color: ColorResources.cardColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: items.map((item) => _buildArrivalTile(item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildArrivalTile(NewArrivalItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Movie Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
              item.imageUrl,
              width: 130,
              height: 68,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 130,
                  height: 68,
                  color: const Color(0xFF2C2C2C),
                  child: const Icon(Icons.movie, color: ColorResources.grey),
                );
              },
            ),
          ),
          gap14,

          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Arrival',
                  style: TextStyle(
                    color: ColorResources.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.title,
                  style: const TextStyle(
                    color: ColorResources.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gap2,
                Text(
                  item.date,
                  style: const TextStyle(
                    color: ColorResources.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
