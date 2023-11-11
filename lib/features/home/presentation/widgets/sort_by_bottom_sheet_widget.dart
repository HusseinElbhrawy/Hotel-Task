import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';

class SortByBottomSheetWidget extends StatelessWidget {
  const SortByBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 14,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Center(
                child: Text(
                  'Sort By',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: () {
                    context.mayPop();
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        const SortedByOptionWidget(),
      ],
    );
  }
}

class SortedByOptionWidget extends StatefulWidget {
  const SortedByOptionWidget({
    super.key,
  });

  @override
  State<SortedByOptionWidget> createState() => _SortedByOptionWidgetState();
}

class _SortedByOptionWidgetState extends State<SortedByOptionWidget> {
  int currentIndex = 0;
  final List _options = [
    'Our Recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating Only',
    'Price Only',
    'Distance Only',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: List.generate(
          _options.length,
          (index) => ListTile(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            title: Text(
              _options[index],
              style: context.textTheme.bodyLarge!.copyWith(
                fontSize: 16.sp,
              ),
            ),
            trailing: currentIndex == index
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
