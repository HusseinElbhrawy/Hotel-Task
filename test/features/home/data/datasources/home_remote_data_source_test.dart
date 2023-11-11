import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_task/core/api/api_consumer.dart';
import 'package:hotel_task/core/api/end_point.dart';
import 'package:hotel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hotel_task/features/home/data/models/hotels.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiConsumer])
void main() {
  late HomeRemoteDataSource remoteDataSource;
  late ApiConsumer apiConsumer;

  setUp(() {
    apiConsumer = MockApiConsumer();
    remoteDataSource = HomeRemoteDataSource(apiConsumer);
  });
  test(
    'test get all hotels without errors',
    () async {
      //Arrange
      final data = List.generate(
        6,
        (index) => Hotels(
          name: 'Name $index',
          starts: index,
          price: index,
          currency: 'currency $index',
          image: 'image $index',
          reviewScore: index,
          review: 'review $index',
          address: 'address $index',
        ),
      );
      final response = Response(
        requestOptions: RequestOptions(
          baseUrl: EndPoint.baseUrl,
          path: EndPoint.hotels,
          method: 'GET',
        ),
        statusCode: 200,
        data: data,
      );

      when(apiConsumer.get(EndPoint.hotels)).thenAnswer(
        (_) async => response,
      );
      //Act
      final result = await remoteDataSource.getHotels();
      //Assert
      expect(result, response);
    },
  );

  test(
    'test get all hotels with errors',
    () async {
      //Arrange

      final response = Response(
        requestOptions: RequestOptions(
          baseUrl: EndPoint.baseUrl,
          path: EndPoint.hotels,
          method: 'GET',
        ),
        statusCode: 400,
      );

      when(apiConsumer.get(EndPoint.hotels)).thenAnswer(
        (_) async => response,
      );
      //Act
      final result = await remoteDataSource.getHotels();
      //Assert
      expect(result, response);
    },
  );
}
