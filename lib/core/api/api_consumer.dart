import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? query,
  });
}
