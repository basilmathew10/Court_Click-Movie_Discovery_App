import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/presentation/coming_soon/widgets/coming_soon_card_widget.dart';
import 'package:court_click_movie_dicovery_app/presentation/coming_soon/widgets/coming_soon_notifications_widget.dart';

class ComingSoonMainScreen extends StatelessWidget {
  const ComingSoonMainScreen({super.key});

  static const List<ComingSoonMovieModel> comingSoonFeed = [
    ComingSoonMovieModel(
      bannerUrl:
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=1000&auto=format&fit=crop',
      title: 'Castle & Castle',
      releaseDate: 'Season 1 Coming December 14',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
      genres: [
        'Steamy',
        'Soapy',
        'Slow Burn',
        'Suspenseful',
        'Teen',
        'Mystery',
      ],
    ),
    ComingSoonMovieModel(
      bannerUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1000&auto=format&fit=crop',
      title: 'Tiny Pretty Things',
      releaseDate: 'Season 1 Coming December 14',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
      genres: [
        'Steamy',
        'Soapy',
        'Slow Burn',
        'Suspenseful',
        'Teen',
        'Mystery',
      ],
    ),
    ComingSoonMovieModel(
      bannerUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1000&auto=format&fit=crop',
      title: 'Faster',
      releaseDate: 'Season 1 Coming December 14',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
      genres: [
        'Steamy',
        'Soapy',
        'Slow Burn',
        'Suspenseful',
        'Teen',
        'Mystery',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Top Notifications & New Arrivals Section
            const ComingSoonNotificationsWidget(),
            gap24,

            // Upcoming Show Feed List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: comingSoonFeed.length,
              separatorBuilder: (context, index) => gap30,
              itemBuilder: (context, index) {
                final movie = comingSoonFeed[index];
                return ComingSoonCardWidget(
                  movie: movie,
                  onRemindMeTap: () {},
                  onShareTap: () {},
                );
              },
            ),
            gap48,
          ],
        ),
      ),
    );
  }
}
