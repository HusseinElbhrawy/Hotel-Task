import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_task/core/utils/request_state.dart';
import 'package:hotel_task/features/home/logic/cubit/home_cubit.dart';
import 'package:hotel_task/features/home/presentation/widgets/error_widget.dart';
import 'package:hotel_task/features/home/presentation/widgets/home_loaded_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.getHotelsState != current.getHotelsState;
      },
      builder: (context, state) {
        switch (state.getHotelsState) {
          case RequestState.ideal:
          case RequestState.loading:
            return const Material(
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          case RequestState.loaded:
            return const HomeLoadedWidget();
          case RequestState.error:
            return HomeErrorWidget(
              errorMessage: state.errorMessage.toString(),
            );
        }
      },
    );
  }
}
