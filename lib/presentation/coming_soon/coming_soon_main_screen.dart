import 'package:court_click_movie_dicovery_app/application/core/app_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/application/home/home_bloc.dart';
import 'package:court_click_movie_dicovery_app/domain/home/models/common_home_response.dart';
import 'package:court_click_movie_dicovery_app/presentation/coming_soon/widgets/coming_soon_card_widget.dart';
import 'package:court_click_movie_dicovery_app/presentation/coming_soon/widgets/coming_soon_notifications_widget.dart';

class ComingSoonMainScreen extends StatefulWidget {
  const ComingSoonMainScreen({super.key});

  @override
  State<ComingSoonMainScreen> createState() => _ComingSoonMainScreenState();
}

class _ComingSoonMainScreenState extends State<ComingSoonMainScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchUpcomingMovies();
    _scrollController.addListener(_onScroll);
  }

  void _fetchUpcomingMovies() {
    final bloc = context.read<HomeBloc>();
    bloc.add(
      const HomeEvent.getMoviesListing(apiKey: AppDetails.apiKey, type: 'upcoming', page: 1),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final bloc = context.read<HomeBloc>();
      final state = bloc.state;
      if (!state.isLoadingMoreUpcoming &&
          state.upcomingMoviesStatus == ApiStatus.success &&
          state.upcomingCurrentPage < state.upcomingTotalPages) {
        bloc.add(
          HomeEvent.getMoviesListing(
            apiKey: AppDetails.apiKey,
            type: 'upcoming',
            page: state.upcomingCurrentPage + 1,
          ),
        );
      }
    }
  }

  ComingSoonMovieModel _mapResultToComingSoonModel(Result result) {
    final path = result.backdropPath ?? result.posterPath;
    String bannerUrl =
        'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=1000&auto=format&fit=crop';
    if (path != null && path.isNotEmpty) {
      bannerUrl = path.startsWith('http')
          ? path
          : 'https://image.tmdb.org/t/p/w780$path';
    }

    final title =
        result.title ?? result.originalTitle ?? result.name ?? 'Untitled';
    final releaseDate =
        result.releaseDate != null && result.releaseDate!.isNotEmpty
            ? 'Coming ${result.releaseDate}'
            : 'Coming Soon';
    final description = (result.overview != null && result.overview!.isNotEmpty)
        ? result.overview!
        : 'No description available.';

    return ComingSoonMovieModel(
      bannerUrl: bannerUrl,
      title: title,
      releaseDate: releaseDate,
      description: description,
      genres: const ['Upcoming', 'Action', 'Drama', 'Suspenseful', 'Thriller'],
    );
  }

  NewArrivalItem _mapResultToArrivalItem(Result result) {
    final title =
        result.title ?? result.originalTitle ?? result.name ?? 'Untitled';
    final path = result.backdropPath ?? result.posterPath;
    String imageUrl = '';
    if (path != null && path.isNotEmpty) {
      imageUrl = path.startsWith('http')
          ? path
          : 'https://image.tmdb.org/t/p/w500$path';
    }
    final date = result.releaseDate ?? result.firstAirDate ?? 'Coming Soon';
    return NewArrivalItem(title: title, imageUrl: imageUrl, date: date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.scaffoldBackground,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final status = state.upcomingMoviesStatus;
          final isLoading =
              status == ApiStatus.loading || status == ApiStatus.initial;
          final isError = status == ApiStatus.error;

          final results = state.upcomingMoviesList.isNotEmpty
              ? state.upcomingMoviesList
              : (state.upcomingMoviesResponse?.results ?? []);
          final isEmpty = !isLoading && !isError && results.isEmpty;

          if (isError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: ColorResources.red,
                      size: 40,
                    ),
                    gap12,
                    Text(
                      state.errorMessage.isNotEmpty
                          ? state.errorMessage
                          : 'Failed to load upcoming movies',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ColorResources.grey,
                        fontSize: 14,
                      ),
                    ),
                    gap16,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: _fetchUpcomingMovies,
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: ColorResources.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (isEmpty) {
            return const Center(
              child: Text(
                'No upcoming movies found',
                style: TextStyle(color: ColorResources.grey, fontSize: 15),
              ),
            );
          }

          final arrivalItems = isLoading
              ? ComingSoonNotificationsWidget.defaultItems
              : results.take(2).map((r) => _mapResultToArrivalItem(r)).toList();

          final feedList = isLoading
              ? mockFeed
              : results.map((r) => _mapResultToComingSoonModel(r)).toList();

          return RefreshIndicator(
            color: ColorResources.primary,
            backgroundColor: ColorResources.cardColor,
            onRefresh: () async {
              _fetchUpcomingMovies();
              await Future.delayed(const Duration(milliseconds: 600));
            },
            child: Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  children: [
                    // Top Notifications & New Arrivals Section
                    ComingSoonNotificationsWidget(items: arrivalItems),
                    gap24,

                    // Upcoming Show Feed List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: feedList.length,
                      separatorBuilder: (context, index) => gap30,
                      itemBuilder: (context, index) {
                        final movie = feedList[index];
                        return ComingSoonCardWidget(
                          movie: movie,
                          onRemindMeTap: () {},
                          onShareTap: () {},
                        );
                      },
                    ),

                    // Bottom Loading Indicator for Infinite Scroll
                    if (state.isLoadingMoreUpcoming)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorResources.primary,
                            strokeWidth: 2.5,
                          ),
                        ),
                      ),
                    gap48,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static const List<ComingSoonMovieModel> mockFeed = [
    ComingSoonMovieModel(
      bannerUrl: '',
      title: 'Loading Upcoming Title...',
      releaseDate: 'Season 1 Coming Soon',
      description: 'Loading description details for the upcoming show...',
      genres: ['Loading', 'Upcoming'],
    ),
    ComingSoonMovieModel(
      bannerUrl: '',
      title: 'Loading Upcoming Title...',
      releaseDate: 'Season 1 Coming Soon',
      description: 'Loading description details for the upcoming show...',
      genres: ['Loading', 'Upcoming'],
    ),
  ];
}
