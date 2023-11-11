import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_task/core/api/api_consumer.dart';
import 'package:hotel_task/core/api/app_interceptor.dart';
import 'package:hotel_task/core/api/dio_consumer.dart';
import 'package:hotel_task/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hotel_task/features/home/data/repositories/home_repository.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //!Bloc
  serviceLocator.registerLazySingleton(() => HomeCubit(serviceLocator()));

  //!Repo
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      homeRemoteDataSource: serviceLocator(),
    ),
  );

  //!Data Source
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(
      serviceLocator(),
    ),
  );

  //!Core

  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(dio: serviceLocator()));

  //!External
  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator
      .registerLazySingleton(() => DioConsumer(dio: serviceLocator()));
}
