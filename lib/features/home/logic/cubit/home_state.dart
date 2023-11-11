part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getHotelsState = RequestState.ideal,
    this.errorMessage,
    this.hotels = const [],
    this.favoriteHotels = const [],
  });

  final RequestState getHotelsState;
  final String? errorMessage;
  final List<Hotels> hotels;

  final List<Hotels> favoriteHotels;

  @override
  List<Object?> get props => [
        getHotelsState,
        errorMessage,
        hotels,
        favoriteHotels,
      ];

  HomeState copyWith({
    RequestState? getHotelsState,
    String? errorMessage,
    List<Hotels>? hotels,
    List<Hotels>? favoriteHotels,
  }) {
    return HomeState(
      getHotelsState: getHotelsState ?? this.getHotelsState,
      errorMessage: errorMessage ?? this.errorMessage,
      hotels: hotels ?? this.hotels,
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
    );
  }
}
