import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';

class SearchMovieItem {
  final String title;
  final String imageUrl;

  const SearchMovieItem({required this.title, required this.imageUrl});
}

class TopSearchItemTile extends StatelessWidget {
  final SearchMovieItem item;
  final VoidCallback? onPlayTap;

  const TopSearchItemTile({super.key, required this.item, this.onPlayTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      color: ColorResources.cardColor,
      child: Row(
        children: [
          // Movie Poster Thumbnail
          SizedBox(
            width: 140,
            height: 76,
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Center(
                    child: Icon(Icons.movie, color: ColorResources.grey),
                  ),
                );
              },
            ),
          ),

          // Movie Title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ColorResources.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Play Icon Button
          GestureDetector(
            onTap: onPlayTap,
            child: const Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(
                Icons.play_circle_outline,
                color: ColorResources.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
