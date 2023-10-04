import 'package:nowingoogle/domain/enums/user_roles.dart';

String getAvatarUrl(UserRole userRole) {
  switch (userRole) {
    case UserRole.volunteer:
      return "assets/avatar/blue.png";
    case UserRole.organizer:
      return "assets/avatar/red.png";
    case UserRole.speaker:
      return "assets/avatar/green.png";
    default:
      return "assets/avatar/yellow.png";
  }
}
