import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/app/injector.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';
import 'package:hotel_task/features/home/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp(
        title: 'Hotel Task',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          lazy: false,
          create: (context) => serviceLocator<HomeCubit>()..getAllHotels(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
