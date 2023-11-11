import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key, this.icon});
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon ?? Icons.star,
      color: Colors.orange,
      size: 16.sp,
    );
  }
}
