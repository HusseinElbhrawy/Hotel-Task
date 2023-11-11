import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';
import 'package:hotel_task/features/home/presentation/widgets/hotel_item_widget.dart';

class AllHotelsItemWidget extends StatelessWidget {
  const AllHotelsItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.hotels != current.hotels;
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<HomeCubit>().getAllHotels();
          },
          child: ListView.builder(
            padding: EdgeInsets.only(top: 80.h),
            physics: const BouncingScrollPhysics(),
            itemCount: state.hotels.length,
            itemBuilder: (context, index) {
              return HotelItemWidget(hotels: state.hotels[index])
                  .animate()
                  .slideX(duration: const Duration(seconds: 1));
            },
          ),
        );
      },
    );
  }
}
