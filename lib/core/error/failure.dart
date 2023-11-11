import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final Map<String, dynamic>? data;

  const Failure({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  // final Map<String, dynamic>? data;

  const AuthFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

class EditProfileFailure extends Failure {
  // List<String>
  // @override
  // final Map<String, dynamic>? data;

  const EditProfileFailure({super.message, super.data});

  @override
  List<Object?> get props => [message, data];
}

class SliderFailure extends Failure {
  const SliderFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class CityFailure extends Failure {
  const CityFailure({
    super.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class AddQuestionFailure extends Failure {
  const AddQuestionFailure({
    super.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class CountryFailure extends Failure {
  const CountryFailure({
    super.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class NationalityFailure extends Failure {
  const NationalityFailure({
    super.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class ProfileFailure extends Failure {
  const ProfileFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class OnBoardingFailure extends Failure {
  const OnBoardingFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.data});
  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure()
      : super(message: 'Location permissions are denied');
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({super.message, super.data});
  @override
  List<Object?> get props => [message, data];
}
