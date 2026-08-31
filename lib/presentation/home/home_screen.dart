import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/continue_watching_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/main_hero_card.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/movie_card_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/previews_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/top_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> popularOnNetflixPosters = [
    'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
  ];

  static const List<String> trendingNowPosters = [
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
  ];

  static const List<String> top10NigeriaPosters = [
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
  ];

  static const List<String> myListPosters = [
    'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
  ];

  static const List<String> africanMoviesPosters = [
    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400&auto=format&fit=crop',
  ];

  static const List<String> nollywoodPosters = [
    'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight * 0.53;

    return Scaffold(
      backgroundColor: ColorResources.scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Dynamic Sliver App Bar with Hero Image FlexibleSpace
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0,
            backgroundColor: ColorResources.black,
            expandedHeight: heroHeight,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: const TopNavBar(),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: MainHeroCard(
                onPlayPressed: () {},
                onMyListPressed: () {},
                onInfoPressed: () {},
              ),
            ),
          ),

          const SliverToBoxAdapter(child: gap16),

          // 1. Previews Section Sliver
          const SliverToBoxAdapter(
            child: PreviewsSection(),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 2. Continue Watching Section
          const SliverToBoxAdapter(
            child: ContinueWatchingSection(),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 3. Popular on Netflix
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'Popular on Netflix',
              posterUrls: popularOnNetflixPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 4. Trending Now
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'Trending Now',
              posterUrls: trendingNowPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 5. Top 10 in Nigeria Today
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'Top 10 in Nigeria Today',
              posterUrls: top10NigeriaPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 6. My List
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'My List',
              posterUrls: myListPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 7. African Movies
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'African Movies',
              posterUrls: africanMoviesPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap24),

          // 8. Nollywood Movies & TV
          const SliverToBoxAdapter(
            child: MovieCardSection(
              title: 'Nollywood Movies & TV',
              posterUrls: nollywoodPosters,
            ),
          ),

          const SliverToBoxAdapter(child: gap48),
        ],
      ),
    );
  }
}
