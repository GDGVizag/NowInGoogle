import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object?> get props => [];
}

class OnAppInit extends SplashEvent {
  const OnAppInit();
  @override
  List<Object?> get props => [];
}

class OnSignInWithGoogle extends SplashEvent {
  const OnSignInWithGoogle();
  @override
  List<Object?> get props => [];
}
