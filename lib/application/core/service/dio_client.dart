import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/extentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/logger.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/urls.dart';
import 'package:court_click_movie_dicovery_app/domain/core/exception/custom_exception.dart';

@lazySingleton
class DioClient {
  final Dio dio;
  String? token;
  late String fcmToken;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = Urls.apiVersionUrl
      ..options.connectTimeout = const Duration(milliseconds: 60000)
      ..options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.interceptors.add(RetryOnConnectionResetInterceptor(dio));
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        requestHeader: kDebugMode,
        responseHeader: kDebugMode,
        request: kDebugMode,
        error: kDebugMode,
        compact: kDebugMode,
        enabled: kDebugMode,
      ),
    );
    dio.interceptors.add(InternetConnectionInterceptor());
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            // TODO Navigate
          } else {
            return handler.next(error);
          }
        },
      ),
    );
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      Logger.logError(e);
      throw CustomException(errMsg: "Network connection error. Please retry.");
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      Logger.logError("Dio Get Error: $e");

      if (e is DioException && e.message == "No internet connection") {
        Logger.logWarning(e.response);
        throw CustomException(errMsg: e.message ?? 'No internet connection');
      }

      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.error is SocketException) {
          throw CustomException(errMsg: "Network connection error. Please retry.");
        }

        final message = e.response?.data is Map
            ? (e.response?.data['message'] ?? e.response?.data['status_message'])
            : null;

        if (message != null && message.toString().isNotEmpty && message != 'null') {
          throw CustomException(errMsg: '$message'.capitalize);
        }
      }

      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (_) {
      throw CustomException(errMsg: "Network connection error. Please retry.");
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? 'No internet connection');
      }
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.connectionTimeout ||
            e.error is SocketException) {
          throw CustomException(errMsg: "Network connection error. Please retry.");
        }

        final message = e.response?.data is Map
            ? (e.response?.data['message'] ?? e.response?.data['status_message'])
            : null;

        if (message != null && message.toString().isNotEmpty && message != 'null') {
          throw CustomException(errMsg: '$message'.capitalize);
        }
      }
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? 'No internet connection');
      }
      if (e is DioException) {
        final message = e.response?.data is Map
            ? (e.response?.data['message'] ?? e.response?.data['status_message'])
            : null;

        if (message != null && message.toString().isNotEmpty && message != 'null') {
          throw CustomException(errMsg: '$message'.capitalize);
        }
      }
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? 'No internet connection');
      }
      if (e is DioException) {
        final message = e.response?.data is Map
            ? (e.response?.data['message'] ?? e.response?.data['status_message'])
            : null;

        if (message != null && message.toString().isNotEmpty && message != 'null') {
          throw CustomException(errMsg: '$message'.capitalize);
        }
      }
      throw CustomException(errMsg: e.toString());
    }
  }
}

class RetryOnConnectionResetInterceptor extends Interceptor {
  final Dio dio;

  RetryOnConnectionResetInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.error is SocketException) {
      final options = err.requestOptions;
      final retryCount = (options.extra['retry_count'] as int? ?? 0);
      if (retryCount < 2) {
        options.extra['retry_count'] = retryCount + 1;
        await Future.delayed(const Duration(milliseconds: 350));
        try {
          final response = await dio.fetch(options);
          return handler.resolve(response);
        } catch (e) {
          // Pass error along if retry fails
        }
      }
    }
    return super.onError(err, handler);
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOGI3NTA0MjBkMTUzMjIyMmRmM2ZhMjE0ZTNhYzVmOSIsIm5iZiI6MTc4ODIwOTYzNS43ODU5OTk4LCJzdWIiOiI2YTk1ZTllMzNiOGU2MzNkMTU4ZWEwOWIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.CxZgs3GKGAk7n1imjLGCM7uwfErNdEhQNnDdr20KwLg";

    options.headers.addAll({
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    Logger.logWarning("Headers: ${options.headers.toString()}");
    Logger.logWarning("Params: ${options.queryParameters.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      final statusCode = response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        return super.onResponse(response, handler);
      } else {
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            error: response.data,
            response: response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: "Something went wrong",
          response: response,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}

class InternetConnectionInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return handler.reject(
        DioException(
          requestOptions: options,
          message: 'No internet connection',
          type: DioExceptionType.connectionTimeout,
        ),
      );
    }
    return super.onRequest(options, handler);
  }
}
