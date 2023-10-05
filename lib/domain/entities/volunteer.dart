import 'package:nowingoogle/domain/entities/user.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';

class Volunteer extends User {
  final bool isPOC;
  final List<String> teams;
  const Volunteer({
    super.userRole = UserRole.volunteer,
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
    super.colorScheme = volunteerColorScheme,
    required this.isPOC,
    required this.teams,
  });
}
