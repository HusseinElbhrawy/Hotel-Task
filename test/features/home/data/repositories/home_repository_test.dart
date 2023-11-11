import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_task/core/api/end_point.dart';
import 'package:hotel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hotel_task/features/home/data/models/hotels.dart';
import 'package:hotel_task/features/home/data/repositories/home_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  late HomeRepository homeRepository;
  late HomeRemoteDataSource remoteDataSource;
  setUp(() {
    remoteDataSource = MockHomeRemoteDataSource();
    homeRepository = HomeRepository(homeRemoteDataSource: remoteDataSource);
  });
  test('home repository With Right Case', () async {
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
      ).toMap(),
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
    when(remoteDataSource.getHotels()).thenAnswer((_) async => response);
    //Act
    final result = await homeRepository.getHotels();
    //Assert

    expect(result.isRight(), true);
  });

  test('home repository With Left Case', () async {
    final response = Response(
      requestOptions: RequestOptions(
        baseUrl: EndPoint.baseUrl,
        path: EndPoint.hotels,
        method: 'GET',
      ),
      statusCode: 400,
    );
    when(remoteDataSource.getHotels()).thenAnswer((_) async => response);
    //Act
    final result = await homeRepository.getHotels();
    //Assert

    expect(result.isLeft(), true);
  });
}
