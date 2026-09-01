part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ApiStatus getTrendingMoviesStatus,
    required CommonHomeResponse? getTrendingMoviesResponse,
    required ApiStatus getMoviesListingStatus,
    required CommonHomeResponse? getMoviesListingResponse,
    required ApiStatus popularMoviesStatus,
    required CommonHomeResponse? popularMoviesResponse,
    required ApiStatus topRatedMoviesStatus,
    required CommonHomeResponse? topRatedMoviesResponse,
    required ApiStatus upcomingMoviesStatus,
    required CommonHomeResponse? upcomingMoviesResponse,
    required List<Result> upcomingMoviesList,
    required int upcomingCurrentPage,
    required int upcomingTotalPages,
    required bool isLoadingMoreUpcoming,
    required String errorMessage,
    required String successMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    getTrendingMoviesStatus: ApiStatus.initial,
    getTrendingMoviesResponse: null,
    getMoviesListingStatus: ApiStatus.initial,
    getMoviesListingResponse: null,
    popularMoviesStatus: ApiStatus.initial,
    popularMoviesResponse: null,
    topRatedMoviesStatus: ApiStatus.initial,
    topRatedMoviesResponse: null,
    upcomingMoviesStatus: ApiStatus.initial,
    upcomingMoviesResponse: null,
    upcomingMoviesList: [],
    upcomingCurrentPage: 1,
    upcomingTotalPages: 1,
    isLoadingMoreUpcoming: false,
    errorMessage: '',
    successMessage: '',
  );
}
