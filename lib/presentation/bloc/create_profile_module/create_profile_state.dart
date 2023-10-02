import 'package:equatable/equatable.dart';

abstract class CreateProfileState extends Equatable {
  const CreateProfileState();
  @override
  List<Object?> get props => [];
}

class CreateProfileLoading extends CreateProfileState {}

class CreateProfileError extends CreateProfileState {
  final String error;
  const CreateProfileError({required this.error});
  @override
  List<Object?> get props => [error];
}

class CreateProfileSuccess extends CreateProfileState {}

class CreateProfileFormState extends CreateProfileState {}
