import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';

class MovieCardSection extends StatelessWidget {
  final String title;
  final List<String> posterUrls;

  const MovieCardSection({
    super.key,
    required this.title,
    required this.posterUrls,
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
            itemCount: posterUrls.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final url = posterUrls[index];
              return _buildPosterCard(url);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPosterCard(String url) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 110,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF2C2C2C),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF2C2C2C),
                child: const Center(
                  child: Icon(
                    Icons.movie_creation_outlined,
                    color: ColorResources.grey,
                    size: 32,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
