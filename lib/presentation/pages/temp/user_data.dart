import 'package:nowingoogle/domain/enums/user_roles.dart';

class Message {
  final String message;
  final String poster;
  final int timestamp;
  const Message({
    required this.message,
    required this.poster,
    required this.timestamp,
  });
}

class UserData {
  final String fullName;
  final String name;
  final String image;
  final bool hasActiveStory;
  final UserRole userRole;
  final List<Message> messages;

  const UserData({
    required this.fullName,
    required this.name,
    required this.image,
    required this.hasActiveStory,
    this.userRole = UserRole.attendee,
    this.messages = const [],
  });
}
