import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';

class CustomTitleTextWidget extends StatelessWidget {
  const CustomTitleTextWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.bodyLarge!.copyWith(
        letterSpacing: 5,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
