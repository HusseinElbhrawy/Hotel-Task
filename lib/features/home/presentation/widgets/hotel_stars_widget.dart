import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelStarsWidget extends StatelessWidget {
  const HotelStarsWidget({
    super.key,
    required this.number,
  });
  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          number,
          (index) => Icon(
            Icons.star,
            size: 16.sp,
          ),
        ),
        ...List.generate(
          5 - number,
          (index) => Icon(
            Icons.star_border,
            size: 16.sp,
          ),
        ),
        8.horizontalSpace,
        const Text(
          'Hotel',
        ),
      ],
    );
  }
}
