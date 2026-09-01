import 'package:court_click_movie_dicovery_app/application/core/service/dio_client.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/typedefs.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/urls.dart';
import 'package:court_click_movie_dicovery_app/domain/core/base/safe_api_caller.dart';
import 'package:court_click_movie_dicovery_app/domain/home/i_home_facade.dart';
import 'package:court_click_movie_dicovery_app/domain/home/models/common_home_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomeFacade)
class IHomeFacadeImpl implements IHomeFacade {
  final SafeApiCaller safeApiCaller;
  final DioClient dioClient;

  IHomeFacadeImpl({required this.safeApiCaller, required this.dioClient});

  @override
  ResultFuture<CommonHomeResponse> getTrendingMovies({
    required String apiKey,
    required int page,
  }) {
    return safeApiCaller.execute(
      action: () async {
        return dioClient.get(
          Urls.trending,
          queryParameters: {"api_key": apiKey, "page": page},
        );
      },
      fromMap: (response) {
        return CommonHomeResponse.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }

  @override
  ResultFuture<CommonHomeResponse> getMoviesListing({
    required String apiKey,
    required String type,
    required int page,
  }) {
    return safeApiCaller.execute(
      action: () async {
        return dioClient.get(
          '${Urls.moviesListing}/$type',
          queryParameters: {"api_key": apiKey, "page": page},
        );
      },
      fromMap: (response) {
        return CommonHomeResponse.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }
}
