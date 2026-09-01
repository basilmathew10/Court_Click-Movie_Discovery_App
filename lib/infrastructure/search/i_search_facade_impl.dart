import 'package:court_click_movie_dicovery_app/application/core/service/dio_client.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/typedefs.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/urls.dart';
import 'package:court_click_movie_dicovery_app/domain/core/base/safe_api_caller.dart';
import 'package:court_click_movie_dicovery_app/domain/search/i_search_facade.dart';
import 'package:court_click_movie_dicovery_app/domain/search/models/search_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISearchFacade)
class ISearchFacadeImpl implements ISearchFacade {
  final SafeApiCaller safeApiCaller;
  final DioClient dioClient;

  ISearchFacadeImpl({required this.safeApiCaller, required this.dioClient});

  @override
  ResultFuture<SearchResponse> getSearchResults({
    required String apiKey,
    required String query,
    required int page,
  }) {
    return safeApiCaller.execute(
      action: () async {
        return dioClient.get(
          Urls.search,
          queryParameters: {"page": page, "query": query, "api_key": apiKey},
        );
      },
      fromMap: (response) {
        return SearchResponse.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }
}
