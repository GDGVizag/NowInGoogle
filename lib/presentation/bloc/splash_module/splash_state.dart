import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {}

class SplashUserAvailable extends SplashState {}

class SplashUserLoggedOut extends SplashState {}
