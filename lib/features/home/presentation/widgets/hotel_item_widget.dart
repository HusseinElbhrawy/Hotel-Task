import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_task/core/utils/media_query_values.dart';
import 'package:hotel_task/features/home/data/models/hotels.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';
import 'package:hotel_task/features/home/presentation/widgets/hotel_stars_widget.dart';

class HotelItemWidget extends StatelessWidget {
  const HotelItemWidget({super.key, required this.hotels});

  final Hotels hotels;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: 120.h,
                imageUrl: hotels.image,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                      value: downloadProgress.progress,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
              PositionedDirectional(
                top: 10.w,
                end: 10.w,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.favoriteHotels != current.favoriteHotels;
                    },
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .addOrRemoveFromFavorite(hotels);
                        },
                        icon: Icon(
                          context.read<HomeCubit>().isInFavorites(hotels)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: context.read<HomeCubit>().isInFavorites(hotels)
                              ? Colors.red
                              : Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HotelStarsWidget(number: hotels.starts.toInt()),
                8.verticalSpace,
                Text(
                  hotels.name,
                  style: context.textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(32.r),
                      color: Colors.green.shade900,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 0.h,
                        ),
                        child: Text(
                          hotels.reviewScore.toString(),
                          style: context.textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Text(
                      hotels.review,
                    ),
                    16.horizontalSpace,
                    Icon(
                      Icons.location_on,
                      size: 12.sp,
                    ),
                    Text(
                      hotels.address,
                    ),
                  ],
                ),
                8.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8.r),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'Out lowest price',
                                  style: context.textTheme.bodyLarge!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ),
                            ),
                            8.verticalSpace,
                            Text.rich(
                              TextSpan(
                                style:
                                    context.textTheme.headlineSmall!.copyWith(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.sp,
                                ),
                                text: '\$',
                                children: [
                                  TextSpan(
                                    text: hotels.price.toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.verticalSpace,
                            const Text(
                              'Renaissance',
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'View Deal',
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            8.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'More Prices',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
