import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 120.sp,
          ),
          16.verticalSpace,
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall!.copyWith(),
          ),
          16.verticalSpace,
          ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().getAllHotels();
            },
            child: const Text(
              'Retry',
            ),
          ),
        ],
      ),
    );
  }
}
