import 'package:equatable/equatable.dart';

abstract class CreateProfileState extends Equatable {
  const CreateProfileState();
  @override
  List<Object?> get props => [];
}

class CreateProfileLoading extends CreateProfileState {}

class CreateProfileError extends CreateProfileState {
  final String usernameError;
  final String pincodeError;
  final String error;
  const CreateProfileError(
      {this.usernameError = "", this.pincodeError = "", this.error = ""});
  @override
  List<Object?> get props => [usernameError, pincodeError];
}

class CreateProfileSuccess extends CreateProfileState {}

class CreateProfileFormState extends CreateProfileState {
  final UsernameStatus isUsernameValidated;
  const CreateProfileFormState(
      {this.isUsernameValidated = UsernameStatus.notValidated});
  @override
  List<Object?> get props => [isUsernameValidated];
}

enum UsernameStatus { notValidated, unique, notUnique }
