import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';

class ComingSoonMovieModel {
  final String bannerUrl;
  final String title;
  final String releaseDate;
  final String description;
  final List<String> genres;

  const ComingSoonMovieModel({
    required this.bannerUrl,
    required this.title,
    required this.releaseDate,
    required this.description,
    required this.genres,
  });
}

class ComingSoonCardWidget extends StatelessWidget {
  final ComingSoonMovieModel movie;
  final VoidCallback? onRemindMeTap;
  final VoidCallback? onShareTap;

  const ComingSoonCardWidget({
    super.key,
    required this.movie,
    this.onRemindMeTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Backdrop Banner Image
        SizedBox(
          width: double.infinity,
          height: 210,
          child: Image.network(
            movie.bannerUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF2C2C2C),
                child: const Center(
                  child: Icon(
                    Icons.movie_creation_outlined,
                    color: ColorResources.grey,
                    size: 48,
                  ),
                ),
              );
            },
          ),
        ),
        gap12,

        // Content Area
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Action Buttons Row (Remind Me & Share)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton(
                    iconAsset: AppAssets.reminder,
                    label: 'Remind Me',
                    onTap: onRemindMeTap,
                  ),
                  gap24,
                  _buildActionButton(
                    iconAsset: AppAssets.share,
                    label: 'Share',
                    onTap: onShareTap,
                  ),
                ],
              ),
              gap8,

              // Release Date Subtitle
              Text(
                movie.releaseDate,
                style: const TextStyle(
                  color: ColorResources.secondaryGrey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              gap4,

              // Show Title
              Text(
                movie.title,
                style: const TextStyle(
                  color: ColorResources.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                ),
              ),
              gap8,

              // Description Overview Paragraph
              Text(
                movie.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ColorResources.secondaryGrey,
                  fontSize: 12.5,
                  height: 1.4,
                ),
              ),
              gap12,

              // Genre Tags Bullet List
              Text(
                movie.genres.join('  •  '),
                style: const TextStyle(
                  color: ColorResources.white,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String iconAsset,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconAsset,
            height: 22,
            width: 22,
            fit: BoxFit.contain,
          ),
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
