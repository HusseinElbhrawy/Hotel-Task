import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowResultButtonWidget extends StatelessWidget {
  const ShowResultButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              fixedSize: Size(75.sw, 50.h),
            ),
            onPressed: () {},
            child: const Text(
              'Show Result',
            ),
          ),
        ),
      ),
    );
  }
}
