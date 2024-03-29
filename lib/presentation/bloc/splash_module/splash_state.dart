import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {}

class SplashUserAvailable extends SplashState {}

class SplashUserLoggedOut extends SplashState {}

class SplashError extends SplashState {
  final String error;
  const SplashError({required this.error});
  @override
  List<Object?> get props => [error];
}

class SplashNewUser extends SplashState {}
