import 'package:nowingoogle/models/user_profile_ui_state.dart';

String getAvatarUrl(UserRole userRole) {
  switch (userRole.name.toLowerCase()) {
    case "volunteer":
      return "assets/avatar/blue.png";
    case "organizer":
      return "assets/avatar/red.png";
    case "speaker":
      return "assets/avatar/green.png";
    default:
      return "assets/avatar/yellow.png";
  }
}
