import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/features/home/presentation/widgets/hotel_class_item_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/star_widget.dart';

class HotelClassWidget extends StatefulWidget {
  const HotelClassWidget({super.key});

  @override
  State<HotelClassWidget> createState() => _HotelClassWidgetState();
}

class _HotelClassWidgetState extends State<HotelClassWidget> {
  final List<Widget> _items = [
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarWidget(icon: Icons.star_border),
        StarWidget(),
      ],
    ),
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarWidget(),
        StarWidget(),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StarWidget(),
            StarWidget(),
          ],
        ),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StarWidget(),
            StarWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StarWidget(),
            StarWidget(),
          ],
        ),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StarWidget(),
            StarWidget(),
          ],
        ),
        StarWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StarWidget(),
            StarWidget(),
          ],
        ),
      ],
    )
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
          _items.length,
          (index) => HotelClassItemWidget(
            child: _items[index],
          ),
        ),
      ),
    );
  }
}
