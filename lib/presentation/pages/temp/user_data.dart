import 'package:nowingoogle/domain/enums/user_roles.dart';

class UserData {
  final String name;
  final String image;
  final bool hasActiveStory;
  final UserRole userRole;

  const UserData({
    required this.name,
    required this.image,
    required this.hasActiveStory,
    this.userRole = UserRole.attendee,
  });
}
