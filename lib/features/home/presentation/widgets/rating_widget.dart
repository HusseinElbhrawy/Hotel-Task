import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    super.key,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  final List<Map<String, dynamic>> _ratingItem = [
    {
      'title': '0',
      'color': Colors.red,
    },
    {
      'title': '7',
      'color': Colors.orange,
    },
    {
      'title': '7.5',
      'color': Colors.green.shade400,
    },
    {
      'title': '8',
      'color': Colors.green.shade600,
    },
    {
      'title': '8.5',
      'color': Colors.green.shade900,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 24.h,
        top: 16.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _ratingItem.length,
          (index) => RatingItemWidget(
            bgColor: _ratingItem[index]['color'],
            title: _ratingItem[index]['title'] + '+',
          ),
        ),
      ),
    );
  }
}

class RatingItemWidget extends StatelessWidget {
  const RatingItemWidget(
      {super.key, required this.bgColor, required this.title});
  final Color bgColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        gradient: LinearGradient(
          colors: [
            bgColor,
            bgColor.withOpacity(.8),
            bgColor,
          ],
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
