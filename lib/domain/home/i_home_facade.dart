
import 'package:court_click_movie_dicovery_app/application/core/utils/typedefs.dart';
import 'package:court_click_movie_dicovery_app/domain/home/models/common_home_response.dart';

abstract interface class IHomeFacade {
  ResultFuture<CommonHomeResponse> getTrendingMovies({
    required String apiKey,
    required int page,
  });
  ResultFuture<CommonHomeResponse> getMoviesListing({
    required String apiKey,
    required String type,
    required int page,
  });
}