import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_task/app/injector.dart';
import 'package:hotel_task/core/api/app_interceptor.dart';
import 'package:hotel_task/core/error/exceptions.dart';

import 'api_consumer.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(serviceLocator<AppInterceptor>());

    if (kDebugMode) dio.interceptors.add(serviceLocator<LogInterceptor>());
  }

  @override
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        queryParameters: query,
      );
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        throw const CancelRequestException();
      case DioExceptionType.unknown:
        throw const UnknownException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
    }
  }
}
