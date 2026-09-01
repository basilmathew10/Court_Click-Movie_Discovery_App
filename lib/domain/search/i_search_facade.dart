import 'package:court_click_movie_dicovery_app/application/core/utils/typedefs.dart';
import 'package:court_click_movie_dicovery_app/domain/search/models/search_response.dart';

abstract interface class ISearchFacade {
  ResultFuture<SearchResponse> getSearchResults({
    required String apiKey,
    required String query,
    required int page,
  });
}
