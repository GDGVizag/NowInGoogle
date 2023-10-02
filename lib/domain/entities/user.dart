import 'package:equatable/equatable.dart';
import 'package:nowingoogle/domain/enums/social_platforms.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String? phone;
  final int age;
  final String gender;
  final String place;
  final String career;
  final String organization;
  final String avatar;
  final String bio;
  final Map<SocialPlatform, String> handles;
  final List<String> interests;
  final List<String> blogs;
  final List<String> posts;
  final List<String> events;
  final List<String> followers;
  final List<String> following;
  final bool verified;
  final int strikes;
  final bool blacklisted;

  const User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    this.phone,
    required this.age,
    required this.gender,
    required this.place,
    required this.career,
    required this.organization,
    required this.avatar,
    required this.bio,
    required this.handles,
    required this.interests,
    required this.blogs,
    required this.posts,
    required this.events,
    required this.followers,
    required this.following,
    required this.verified,
    required this.strikes,
    required this.blacklisted,
  });
  @override
  List<Object?> get props => [username];
}
