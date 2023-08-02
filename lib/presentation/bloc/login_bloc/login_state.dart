import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class IsLoggedIn extends LoginState {}

class IsLoggedOut extends LoginState {}
