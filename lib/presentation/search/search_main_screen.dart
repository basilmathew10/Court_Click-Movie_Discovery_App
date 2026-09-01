import 'dart:async';
import 'package:court_click_movie_dicovery_app/application/core/app_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/application/search/search_bloc.dart';
import 'package:court_click_movie_dicovery_app/domain/search/models/search_response.dart';
import 'package:court_click_movie_dicovery_app/presentation/search/widgets/search_header_widget.dart';
import 'package:court_click_movie_dicovery_app/presentation/search/widgets/top_search_item_tile.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({super.key});

  @override
  State<SearchMainScreen> createState() => _SearchMainScreenState();
}

class _SearchMainScreenState extends State<SearchMainScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SearchBloc>();
    bloc.add(
      const SearchEvent.getSearchMovies(
        apiKey: AppDetails.apiKey,
        query: 'a',
        page: 1,
      ),
    );

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 150) {
      final bloc = context.read<SearchBloc>();
      final state = bloc.state;
      if (!state.isLoadingMore &&
          state.getSearchMoviesStatus == ApiStatus.success &&
          state.currentPage < state.totalPages) {
        final query = state.currentQuery.isEmpty ? 'a' : state.currentQuery;
        bloc.add(
          SearchEvent.getSearchMovies(
            apiKey: AppDetails.apiKey,
            query: query,
            page: state.currentPage + 1,
          ),
        );
      }
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 350), () {
      final searchQuery = query.trim().isEmpty ? 'a' : query.trim();
      context.read<SearchBloc>().add(
        SearchEvent.getSearchMovies(
          apiKey: AppDetails.apiKey,
          query: searchQuery,
          page: 1,
        ),
      );
    });
  }

  SearchMovieItem _mapResultToSearchItem(Result result) {
    final title = result.title ?? result.originalTitle ?? 'Untitled';
    final path = result.backdropPath ?? result.posterPath;
    String imageUrl = '';
    if (path != null && path.isNotEmpty) {
      imageUrl = path.startsWith('http')
          ? path
          : 'https://image.tmdb.org/t/p/w500$path';
    }
    return SearchMovieItem(title: title, imageUrl: imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.scaffoldBackground,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: ColorResources.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Search Bar Header
              SearchHeaderWidget(
                controller: _searchController,
                onChanged: _onSearchChanged,
              ),

              // Section Title: Top Searches
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 12),
                child: Text(
                  'Top Searches',
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ),

              // Top Searches List
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    final status = state.getSearchMoviesStatus;
                    final isLoading =
                        status == ApiStatus.loading ||
                        status == ApiStatus.initial;
                    final isError = status == ApiStatus.error;
                    final items = state.searchResultList;
                    final isEmpty = !isLoading && !isError && items.isEmpty;

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
                                size: 36,
                              ),
                              gap12,
                              Text(
                                state.errorMessage.isNotEmpty
                                    ? state.errorMessage
                                    : 'Failed to load search results',
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
                                onPressed: () {
                                  final q = state.currentQuery.isEmpty
                                      ? 'a'
                                      : state.currentQuery;
                                  context.read<SearchBloc>().add(
                                    SearchEvent.getSearchMovies(
                                      apiKey: AppDetails.apiKey,
                                      query: q,
                                      page: 1,
                                    ),
                                  );
                                },
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
                          'No movies found',
                          style: TextStyle(
                            color: ColorResources.grey,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }

                    final itemCount = isLoading
                        ? 8
                        : (items.length + (state.isLoadingMore ? 1 : 0));

                    return Skeletonizer(
                      enabled: isLoading,
                      child: ListView.separated(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: itemCount,
                        separatorBuilder: (context, index) => gap4,
                        itemBuilder: (context, index) {
                          if (isLoading) {
                            const mockItem = SearchMovieItem(
                              title: 'Loading movie title...',
                              imageUrl: '',
                            );
                            return const TopSearchItemTile(item: mockItem);
                          }

                          if (index >= items.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorResources.primary,
                                  strokeWidth: 2.5,
                                ),
                              ),
                            );
                          }

                          final item = _mapResultToSearchItem(items[index]);
                          return TopSearchItemTile(
                            item: item,
                            onPlayTap: () {},
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
