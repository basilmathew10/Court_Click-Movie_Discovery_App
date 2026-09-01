part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required ApiStatus getSearchMoviesStatus,
    required SearchResponse? getSearchMoviesResponse,
    required List<Result> searchResultList,
    required int currentPage,
    required int totalPages,
    required bool isLoadingMore,
    required String currentQuery,
    required String errorMessage,
    required String successMessage,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
    getSearchMoviesStatus: ApiStatus.initial,
    getSearchMoviesResponse: null,
    searchResultList: [],
    currentPage: 1,
    totalPages: 1,
    isLoadingMore: false,
    currentQuery: '',
    errorMessage: '',
    successMessage: '',
  );
}
