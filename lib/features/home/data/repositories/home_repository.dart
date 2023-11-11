import 'package:dartz/dartz.dart';
import 'package:hotel_task/core/error/failure.dart';
import 'package:hotel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hotel_task/features/home/data/models/hotels.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  const HomeRepository({required this.homeRemoteDataSource});

  Future<Either<Failure, List<Hotels>>> getHotels() async {
    try {
      final response = await homeRemoteDataSource.getHotels();
      if (response.statusCode == 200) {
        return Right(
          (response.data as List).map((e) => Hotels.fromMap(e)).toList(),
        );
      }
      return Left(
        ServerFailure(
          data: response.data,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
