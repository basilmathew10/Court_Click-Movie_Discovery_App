part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.getSearchMovies({
    required String apiKey,
    required String query,
    required int page,
  }) = _GetSearchMovies;
}