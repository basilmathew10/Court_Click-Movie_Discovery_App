part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getTrendingMovies({
    required String apiKey,
    required int page,
  }) = _GetTrendingMovies;

  const factory HomeEvent.getMoviesListing({
    required String apiKey,
    required String type,
    required int page,
  }) = _GetMoviesListing;
}
