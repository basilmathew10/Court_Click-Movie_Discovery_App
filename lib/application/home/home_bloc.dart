import 'package:bloc/bloc.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/enums.dart';
import 'package:court_click_movie_dicovery_app/domain/home/i_home_facade.dart';
import 'package:court_click_movie_dicovery_app/domain/home/models/common_home_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeFacade _homeFacade;

  HomeBloc(this._homeFacade) : super(HomeState.initial()) {
    on<_GetTrendingMovies>(_onGetTrendingMovies);
    on<_GetMoviesListing>(_onGetMoviesListing);
  }

  Future<void> _onGetTrendingMovies(
    _GetTrendingMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getTrendingMoviesStatus: ApiStatus.loading));

    final result = await _homeFacade.getTrendingMovies(
      apiKey: event.apiKey,
      page: event.page,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getTrendingMoviesStatus: ApiStatus.error,
            errorMessage: failure.errorMsg,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getTrendingMoviesStatus: ApiStatus.success,
            getTrendingMoviesResponse: response,
          ),
        );
      },
    );
  }

  Future<void> _onGetMoviesListing(
    _GetMoviesListing event,
    Emitter<HomeState> emit,
  ) async {
    if (event.type == 'popular') {
      emit(
        state.copyWith(
          getMoviesListingStatus: ApiStatus.loading,
          popularMoviesStatus: ApiStatus.loading,
        ),
      );
    } else if (event.type == 'top_rated') {
      emit(
        state.copyWith(
          getMoviesListingStatus: ApiStatus.loading,
          topRatedMoviesStatus: ApiStatus.loading,
        ),
      );
    } else if (event.type == 'upcoming') {
      if (event.page == 1) {
        emit(
          state.copyWith(
            getMoviesListingStatus: ApiStatus.loading,
            upcomingMoviesStatus: ApiStatus.loading,
            isLoadingMoreUpcoming: false,
            upcomingCurrentPage: 1,
          ),
        );
      } else {
        if (state.isLoadingMoreUpcoming ||
            state.upcomingCurrentPage >= state.upcomingTotalPages) {
          return;
        }
        emit(state.copyWith(isLoadingMoreUpcoming: true));
      }
    } else {
      emit(state.copyWith(getMoviesListingStatus: ApiStatus.loading));
    }

    final result = await _homeFacade.getMoviesListing(
      apiKey: event.apiKey,
      type: event.type,
      page: event.page,
    );

    result.fold(
      (failure) {
        if (event.type == 'popular') {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.error,
              popularMoviesStatus: ApiStatus.error,
              errorMessage: failure.errorMsg,
            ),
          );
        } else if (event.type == 'top_rated') {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.error,
              topRatedMoviesStatus: ApiStatus.error,
              errorMessage: failure.errorMsg,
            ),
          );
        } else if (event.type == 'upcoming') {
          emit(
            state.copyWith(
              getMoviesListingStatus: event.page == 1
                  ? ApiStatus.error
                  : state.getMoviesListingStatus,
              upcomingMoviesStatus: event.page == 1
                  ? ApiStatus.error
                  : state.upcomingMoviesStatus,
              isLoadingMoreUpcoming: false,
              errorMessage: failure.errorMsg,
            ),
          );
        } else {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.error,
              errorMessage: failure.errorMsg,
            ),
          );
        }
      },
      (response) {
        if (event.type == 'popular') {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.success,
              getMoviesListingResponse: response,
              popularMoviesStatus: ApiStatus.success,
              popularMoviesResponse: response,
            ),
          );
        } else if (event.type == 'top_rated') {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.success,
              getMoviesListingResponse: response,
              topRatedMoviesStatus: ApiStatus.success,
              topRatedMoviesResponse: response,
            ),
          );
        } else if (event.type == 'upcoming') {
          final newResults = response.results ?? [];
          final combinedList = event.page == 1
              ? newResults
              : [...state.upcomingMoviesList, ...newResults];
          final totalPages = response.totalPages ?? 1;

          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.success,
              getMoviesListingResponse: response,
              upcomingMoviesStatus: ApiStatus.success,
              upcomingMoviesResponse: response,
              upcomingMoviesList: combinedList,
              upcomingCurrentPage: response.page ?? event.page,
              upcomingTotalPages: totalPages,
              isLoadingMoreUpcoming: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              getMoviesListingStatus: ApiStatus.success,
              getMoviesListingResponse: response,
            ),
          );
        }
      },
    );
  }
}
