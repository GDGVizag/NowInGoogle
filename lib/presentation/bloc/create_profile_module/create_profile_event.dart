import 'package:equatable/equatable.dart';

abstract class CreateProfileEvent extends Equatable {
  const CreateProfileEvent();
  @override
  List<Object?> get props => [];
}

class OnCreateProfile extends CreateProfileEvent {
  final String username;
  final String gender;
  final String career;
  final String organization;
  final String pincode;
  const OnCreateProfile(
      {required this.username,
      required this.gender,
      required this.career,
      required this.organization,
      required this.pincode});
  @override
  List<Object?> get props => [career, organization, pincode];
}
