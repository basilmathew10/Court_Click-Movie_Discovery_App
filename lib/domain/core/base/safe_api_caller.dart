import 'package:dio/dio.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/extentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/typedefs.dart';
import 'package:court_click_movie_dicovery_app/domain/core/base/run_safely.dart';
import 'package:court_click_movie_dicovery_app/domain/core/exception/custom_exception.dart';
import 'package:court_click_movie_dicovery_app/domain/core/failures/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SafeApiCaller {
  final RunSafely runSafely;

  SafeApiCaller({
    required this.runSafely,
  });

  ResultFuture<T> execute<T>({
    required Future<Response<dynamic>> Function() action,
    T Function(Response)? fromMap,
    T? data,
    MainFailure Function(String error)? failure,
  }) {
    return runSafely.runSafely<T>(
      () async {
        assert(
          data != null || fromMap != null,
          'You must provide either a data object or a fromMap function',
        );

        final response = await action();
        if (response.isOk) {
          if (data != null) return data;
          return fromMap!(response);
        }
        throw CustomException(errMsg: response.message);
      },
      failure: failure,
    );
  }
}