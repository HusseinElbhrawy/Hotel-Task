import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelClassItemWidget extends StatelessWidget {
  const HotelClassItemWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      // height: 40.h,
      height: 55.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.orange,
      )),
      child: child,
    );
  }
}
