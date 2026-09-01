import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';

class MovieCardSection extends StatelessWidget {
  final String title;
  final List<String> posterUrls;
  final ApiStatus status;
  final VoidCallback? onRetry;

  const MovieCardSection({
    super.key,
    required this.title,
    required this.posterUrls,
    this.status = ApiStatus.success,
    this.onRetry,
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
        _buildContent(),
      ],
    );
  }

  Widget _buildContent() {
    if (status == ApiStatus.error) {
      return Container(
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: ColorResources.red, size: 28),
              gap8,
              const Text(
                'Failed to load movies',
                style: TextStyle(color: ColorResources.grey, fontSize: 13),
              ),
              gap8,
              if (onRetry != null)
                InkWell(
                  onTap: onRetry,
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorResources.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        color: ColorResources.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    final isLoading = status == ApiStatus.loading || status == ApiStatus.initial;
    final isSuccess = status == ApiStatus.success;
    final isEmpty = isSuccess && posterUrls.isEmpty;

    if (isEmpty) {
      return Container(
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'No movies found',
            style: TextStyle(color: ColorResources.grey, fontSize: 13),
          ),
        ),
      );
    }

    final displayPosters = isLoading
        ? List.generate(5, (_) => '')
        : posterUrls;

    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: displayPosters.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final url = displayPosters[index];
            return _buildPosterCard(url, isLoading);
          },
        ),
      ),
    );
  }

  Widget _buildPosterCard(String url, bool isLoading) {
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
          child: isLoading || url.isEmpty
              ? Container(color: const Color(0xFF2C2C2C))
              : CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
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
