import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';
import 'package:hotel_task/features/home/presentation/widgets/custom_title_text_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/distance_from_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/hotel_class_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/rating_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/show_result_button_widget.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Reset',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Filter',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.mayPop();
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Row(
            children: [
              const CustomTitleTextWidget(
                title: 'PRICE PER NIGHT',
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Text(
                  '540+ \$',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomSliderWidget(),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleTextWidget(
                title: 'rating'.toUpperCase(),
              ),
              const RatingWidget(),
              CustomTitleTextWidget(
                title: 'hotel class'.toUpperCase(),
              ),
              const HotelClassWidget(),
              CustomTitleTextWidget(
                title: 'distance from'.toUpperCase(),
              ),
              const DistanceFromWidget(),
              const ShowResultButtonWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    super.key,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  double currentValue = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: currentValue,
          max: 540,
          min: 20,
          thumbColor: Colors.white,
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: const Row(
            children: [
              Text('20 \$'),
              Spacer(),
              Text('540 \$'),
            ],
          ),
        ),
      ],
    );
  }
}
