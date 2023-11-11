import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_task/core/utils/request_state.dart';
import 'package:hotel_task/features/home/data/models/hotels.dart';
import 'package:hotel_task/features/home/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(const HomeState());

  void getAllHotels() async {
    emit(state.copyWith(getHotelsState: RequestState.loading));

    final result = await homeRepository.getHotels();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getHotelsState: RequestState.error,
            errorMessage: failure.message,
          ),
        );
      },
      (hotels) {
        emit(
          state.copyWith(getHotelsState: RequestState.loaded, hotels: hotels),
        );
      },
    );
  }

  void addOrRemoveFromFavorite(Hotels hotel) {
    final favoriteHotels = [...state.favoriteHotels];
    if (favoriteHotels.contains(hotel)) {
      favoriteHotels.remove(hotel);
    } else {
      favoriteHotels.add(hotel);
    }
    emit(state.copyWith(favoriteHotels: favoriteHotels));
  }

  bool isInFavorites(Hotels hotel) {
    return state.favoriteHotels.contains(hotel);
  }
}
