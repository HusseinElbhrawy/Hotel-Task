import 'package:dio/dio.dart';
import 'package:hotel_task/core/api/api_consumer.dart';
import 'package:hotel_task/core/api/end_point.dart';

class HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  const HomeRemoteDataSource(this.apiConsumer);

  Future<Response> getHotels() async {
    final response = await apiConsumer.get(EndPoint.hotels);
    return response;
  }
}
