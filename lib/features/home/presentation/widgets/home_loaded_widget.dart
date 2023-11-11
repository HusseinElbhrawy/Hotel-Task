import 'package:flutter/material.dart';
import 'package:hotel_task/features/home/presentation/widgets/all_hotels_item_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/custom_google_map_button_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/filter_and_sort_widget.dart';

class HomeLoadedWidget extends StatelessWidget {
  const HomeLoadedWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AllHotelsItemWidget(),
            FilterAndSortWidget(),
            CustomGoogleMapButtonWidget(),
          ],
        ),
      ),
    );
  }
}
