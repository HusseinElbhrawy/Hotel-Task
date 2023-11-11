import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/features/home/presentation/widgets/filter_bottom_sheet_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/sort_by_bottom_sheet_widget.dart';

class FilterAndSortWidget extends StatelessWidget {
  const FilterAndSortWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          height: 60.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 16.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.r,
                offset: const Offset(0, 5),
                spreadRadius: 2.r,
              ),
            ],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(16.r),
              bottomStart: Radius.circular(16.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return const FilterBottomSheetWidget();
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.filter_alt_outlined),
                    8.horizontalSpace,
                    const Text(
                      'Filters',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return const SortByBottomSheetWidget();
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.filter_list_sharp),
                    8.horizontalSpace,
                    const Text(
                      'Sort',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
