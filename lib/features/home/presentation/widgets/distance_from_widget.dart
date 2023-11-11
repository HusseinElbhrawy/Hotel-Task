import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';

class DistanceFromWidget extends StatelessWidget {
  const DistanceFromWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          Divider(
            color: Colors.grey,
            thickness: 1.h,
          ),
          8.verticalSpace,
          Row(
            children: [
              Text(
                'Location',
                style:
                    context.textTheme.headlineSmall!.copyWith(fontSize: 20.sp),
              ),
              const Spacer(),
              Text(
                'City Center',
                style: context.textTheme.bodyLarge,
              ),
              12.horizontalSpace,
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12.sp,
              ),
            ],
          ),
          8.verticalSpace,
          Divider(
            color: Colors.grey,
            thickness: 1.h,
          ),
        ],
      ),
    );
  }
}
