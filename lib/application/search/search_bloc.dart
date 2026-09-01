import 'package:bloc/bloc.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/domain/search/i_search_facade.dart';
import 'package:court_click_movie_dicovery_app/domain/search/models/search_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchFacade _searchFacade;

  SearchBloc(this._searchFacade) : super(SearchState.initial()) {
    on<_GetSearchMovies>(_onGetSearchMovies);
  }

  Future<void> _onGetSearchMovies(
    _GetSearchMovies event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(
        state.copyWith(
          getSearchMoviesStatus: ApiStatus.success,
          searchResultList: [],
          currentQuery: '',
          currentPage: 1,
          totalPages: 1,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final isNewSearch = event.page == 1 || query != state.currentQuery;

    if (isNewSearch) {
      emit(
        state.copyWith(
          getSearchMoviesStatus: ApiStatus.loading,
          isLoadingMore: false,
          currentQuery: query,
          currentPage: 1,
        ),
      );
    } else {
      if (state.isLoadingMore || state.currentPage >= state.totalPages) return;
      emit(state.copyWith(isLoadingMore: true));
    }

    final result = await _searchFacade.getSearchResults(
      apiKey: event.apiKey,
      query: query,
      page: event.page,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getSearchMoviesStatus:
                isNewSearch ? ApiStatus.error : state.getSearchMoviesStatus,
            isLoadingMore: false,
            errorMessage: failure.errorMsg,
          ),
        );
      },
      (response) {
        final newResults = response.results ?? [];
        final combinedList = isNewSearch
            ? newResults
            : [...state.searchResultList, ...newResults];

        emit(
          state.copyWith(
            getSearchMoviesStatus: ApiStatus.success,
            getSearchMoviesResponse: response,
            searchResultList: combinedList,
            currentPage: response.page ?? event.page,
            totalPages: response.totalPages ?? 1,
            isLoadingMore: false,
            currentQuery: query,
          ),
        );
      },
    );
  }
}
