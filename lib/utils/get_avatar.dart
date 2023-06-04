String getAvatarUrl(String userRole) {
  switch (userRole.toLowerCase()) {
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
