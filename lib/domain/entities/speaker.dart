import 'package:nowingoogle/domain/entities/user.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';

class Speaker extends User {
  final String talkTitle;
  final int talkTime;
  const Speaker({
    super.userRole = UserRole.speaker,
    required super.firstName,
    required super.lastName,
    required super.username,
    required super.email,
    super.phone,
    required super.age,
    required super.gender,
    required super.place,
    required super.career,
    required super.organization,
    required super.avatar,
    required super.bio,
    required super.handles,
    required super.interests,
    required super.blogs,
    required super.posts,
    required super.events,
    required super.followers,
    required super.following,
    required super.verified,
    required super.strikes,
    required super.blacklisted,
    super.colorScheme = speakerColorScheme,
    required this.talkTitle,
    required this.talkTime,
  });
}
