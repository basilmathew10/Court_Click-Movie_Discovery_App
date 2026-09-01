import 'package:court_click_movie_dicovery_app/application/core/app_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/application/home/home_bloc.dart';
import 'package:court_click_movie_dicovery_app/domain/home/models/common_home_response.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/continue_watching_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/main_hero_card.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/movie_card_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/previews_section.dart';
import 'package:court_click_movie_dicovery_app/presentation/home/widgets/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchHomeData();
  }

  void _fetchHomeData() {
    final bloc = context.read<HomeBloc>();
    bloc.add(const HomeEvent.getTrendingMovies(apiKey: AppDetails.apiKey, page: 1));
    bloc.add(
      const HomeEvent.getMoviesListing(apiKey: AppDetails.apiKey, type: 'popular', page: 1),
    );
    bloc.add(
      const HomeEvent.getMoviesListing(
        apiKey: AppDetails.apiKey,
        type: 'top_rated',
        page: 1,
      ),
    );
  }

  List<String> _extractPosterUrls(CommonHomeResponse? response) {
    if (response?.results == null) return [];
    return response!.results!
        .map((r) {
          final path = r.posterPath;
          if (path == null || path.isEmpty) return '';
          if (path.startsWith('http')) return path;
          return 'https://image.tmdb.org/t/p/w500$path';
        })
        .where((url) => url.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight * 0.53;

    return Scaffold(
      backgroundColor: ColorResources.scaffoldBackground,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final popularPosters = _extractPosterUrls(
            state.popularMoviesResponse,
          );
          final trendingPosters = _extractPosterUrls(
            state.getTrendingMoviesResponse,
          );
          final topRatedPosters = _extractPosterUrls(
            state.topRatedMoviesResponse,
          );

          String heroImageUrl =
              'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1000&auto=format&fit=crop';
          String heroRankingText = '#2 in Nigeria Today';

          if (state.getTrendingMoviesResponse?.results != null &&
              state.getTrendingMoviesResponse!.results!.isNotEmpty) {
            final firstResult = state.getTrendingMoviesResponse!.results!.first;
            final path = firstResult.backdropPath ?? firstResult.posterPath;
            if (path != null && path.isNotEmpty) {
              heroImageUrl =
                  path.startsWith('http')
                      ? path
                      : 'https://image.tmdb.org/t/p/w500$path';
            }
            final name = firstResult.title ?? firstResult.name;
            if (name != null && name.isNotEmpty) {
              heroRankingText = '#1 Trending: $name';
            }
          }

          return RefreshIndicator(
            color: ColorResources.primary,
            backgroundColor: ColorResources.cardColor,
            onRefresh: () async {
              _fetchHomeData();
              await Future.delayed(const Duration(milliseconds: 600));
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
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
                      imageUrl: heroImageUrl,
                      rankingText: heroRankingText,
                      onPlayPressed: () {},
                      onMyListPressed: () {},
                      onInfoPressed: () {},
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: gap16),

                // 1. Previews Section Sliver
                const SliverToBoxAdapter(child: PreviewsSection()),

                const SliverToBoxAdapter(child: gap24),

                // 2. Continue Watching Section
                const SliverToBoxAdapter(child: ContinueWatchingSection()),

                const SliverToBoxAdapter(child: gap24),

                // 3. Popular on Netflix
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'Popular on Netflix',
                    posterUrls: popularPosters,
                    status: state.popularMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getMoviesListing(
                              apiKey: AppDetails.apiKey,
                              type: 'popular',
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap24),

                // 4. Trending Now
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'Trending Now',
                    posterUrls: trendingPosters,
                    status: state.getTrendingMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getTrendingMovies(
                              apiKey: AppDetails.apiKey,
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap24),

                // 5. Top 10 in Nigeria Today
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'Top 10 in Nigeria Today',
                    posterUrls: topRatedPosters,
                    status: state.topRatedMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getMoviesListing(
                              apiKey: AppDetails.apiKey,
                              type: 'top_rated',
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap24),

                // 6. My List
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'My List',
                    posterUrls: topRatedPosters.isNotEmpty ? topRatedPosters.reversed.toList() : popularPosters,
                    status: state.topRatedMoviesStatus == ApiStatus.success ? ApiStatus.success : state.popularMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getMoviesListing(
                              apiKey: AppDetails.apiKey,
                              type: 'top_rated',
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap24),

                // 7. African Movies
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'African Movies',
                    posterUrls: popularPosters.isNotEmpty ? popularPosters.reversed.toList() : trendingPosters,
                    status: state.popularMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getMoviesListing(
                              apiKey: AppDetails.apiKey,
                              type: 'popular',
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap24),

                // 8. Nollywood Movies & TV
                SliverToBoxAdapter(
                  child: MovieCardSection(
                    title: 'Nollywood Movies & TV',
                    posterUrls: trendingPosters.isNotEmpty ? trendingPosters.reversed.toList() : topRatedPosters,
                    status: state.getTrendingMoviesStatus,
                    onRetry: () {
                      context.read<HomeBloc>().add(
                            const HomeEvent.getTrendingMovies(
                              apiKey: AppDetails.apiKey,
                              page: 1,
                            ),
                          );
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: gap48),
              ],
            ),
          );
        },
      ),
    );
  }
}
