import 'dart:convert';
import 'package:cleancode/core/extensions/context_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../main.dart';
import 'either.dart';
import 'endpoints.dart';
import 'error/failure.dart';

class ApiConsumer {
  final Dio _dio;

  ApiConsumer()
      : _dio = Dio(BaseOptions(
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          baseUrl: Endpoints.baseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        )) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      request: true,
    ));
  }

  Future<Either<Failure, Map<String, dynamic>>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());
      final failure = _handleDioError(e);
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// POST request
  Future<Either<Failure, Map<String, dynamic>>> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    FormData? formData,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        url,
        data: formData ?? data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.response.toString());
      Failure failure = _handleDioError(e);
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// PUT request
  Future<Either<Failure, Map<String, dynamic>>> put({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// PATCH request
  Future<Either<Failure, Map<String, dynamic>>> patch({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());

      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// DELETE request
  Future<Either<Failure, Map<String, dynamic>>> delete({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// Download File
  Future<Either<Failure, Map<String, dynamic>>> downloadFile({
    required String url,
    required String savePath,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  /// Upload File
  Future<Either<Failure, Map<String, dynamic>>> uploadFile({
    required String url,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // loggerError(e.toString());
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(
          message: 'An unexpected error occurred${e.toString()}'));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        navigatorKey.currentContext!.showErrorMessage('تم الغاء الطلب');
        return ServerFailure(message: 'تم إلغاء الطلب');
      case DioExceptionType.connectionTimeout:
        navigatorKey.currentContext!.showErrorMessage('انتهت مهلة الاتصال');
        return ServerFailure(message: 'انتهت مهلة الاتصال');
      case DioExceptionType.receiveTimeout:
        navigatorKey.currentContext!.showErrorMessage('انتهت مهلة الاتصال');
        return ServerFailure(message: 'انتهت مهلة الاستقبال في الاتصال');
      case DioExceptionType.sendTimeout:
        navigatorKey.currentContext!.showErrorMessage('انتهت مهلة الاتصال');
        return ServerFailure(message: 'انتهت مهلة الإرسال في الاتصال');
      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          try {
            final data = error.response!.data;

            // Handle if the response is a String and needs decoding.
            final Map<String, dynamic> decoded =
            data is String ? json.decode(data) : data;

            // Handle specific error structure.
            if (decoded.containsKey('success') && decoded['success'] == false) {
              final errorDetails = decoded['error'];
              final message = errorDetails['message'] ?? 'Unknown error occurred';
              navigatorKey.currentContext!.showErrorMessage(message);

              return ServerFailure(
                message: message,
              );
            }

            // Fallback for other structures with 'message'.
            if (decoded.containsKey('message')) {
              final message = decoded['message'];
              navigatorKey.currentContext!.showErrorMessage(message);
              return ServerFailure(message: message);
            }
          } catch (e) {
            navigatorKey.currentContext!.showErrorMessage(
                'Failed to parse error response: ${e.toString()}');
            return ServerFailure(
                message:
                'Received invalid status code: ${error.response?.statusCode}');
          }
        }
        return ServerFailure(
            message:
            'Received invalid status code: ${error.response?.statusCode}');
      case DioExceptionType.badCertificate:
        navigatorKey.currentContext!.showErrorMessage('تعذر الاتصال');
        return ServerFailure(message: 'تعذر الاتصال');
      case DioExceptionType.connectionError:
        navigatorKey.currentContext!.showErrorMessage('تعذر الاتصال');
        return NetworkFailure(message: 'تعذر الاتصال');
      case DioExceptionType.unknown:
      default:
        navigatorKey.currentContext!.showErrorMessage('Unexpected error occurred');
        return UnknownFailure(message: 'Unexpected error: ${error.message}');
    }
  }

  /// Add Interceptors
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  /// Remove All Interceptors
  void removeAllInterceptors() {
    _dio.interceptors.clear();
  }

  /// Update Headers
  void updateHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }
}
