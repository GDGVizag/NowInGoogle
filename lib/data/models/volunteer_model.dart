import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/domain/entities/volunteer.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/pages/constants/color_scheme.dart';

class VolunteerModel extends UserModel {
  final bool isPOC;
  final List<String> teams;
  const VolunteerModel({
    super.userRole = UserRole.volunteer,
    required super.firstName,
    required super.lastName,
    required super.username,
    required super.email,
    super.phone = '',
    super.age = -1,
    required super.gender,
    required super.place,
    required super.career,
    required super.organization,
    super.avatar = '',
    super.bio = '',
    super.handles = const {},
    super.interests = const [],
    super.blogs = const [],
    super.posts = const [],
    super.events = const [],
    super.followers = const [],
    super.following = const [],
    super.verified = false,
    super.strikes = 0,
    super.blacklisted = false,
    this.isPOC = false,
    required this.teams,
  });

  factory VolunteerModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      VolunteerModel(
        firstName: snapshot.get("firstName"),
        lastName: snapshot.get("lastName"),
        username: snapshot.get("username"),
        email: snapshot.get("email"),
        phone: snapshot.get("phone"),
        age: snapshot.get("age"),
        gender: snapshot.get("gender"),
        place: snapshot.get("place"),
        career: snapshot.get("career"),
        organization: snapshot.get("organization"),
        avatar: snapshot.get('avatar'),
        bio: snapshot.get("bio"),
        handles: snapshot.get("handles"),
        interests: snapshot.get("interests"),
        blogs: snapshot.get("blogs"),
        posts: snapshot.get("posts"),
        events: snapshot.get("events"),
        following: snapshot.get("following"),
        //TODO Change the implementation
        followers: snapshot.get("following"),
        verified: snapshot.get("verified"),
        strikes: snapshot.get("strikes"),
        blacklisted: snapshot.get("blacklisted"),
        isPOC: snapshot.get("isPOC"),
        teams: snapshot.get("teams"),
      );
  @override
  Map<String, dynamic> toJson() {
    return super.toJson()..addAll({"isPOC": isPOC, "teams": teams});
  }

  @override
  Volunteer toEntity() {
    return Volunteer(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phone: phone,
        age: age,
        gender: gender,
        place: place,
        career: career,
        organization: organization,
        avatar: avatar,
        bio: bio,
        handles: handles,
        interests: interests,
        blogs: blogs,
        posts: posts,
        events: events,
        followers: followers,
        following: following,
        verified: verified,
        strikes: strikes,
        blacklisted: blacklisted,
        userRole: userRole,
        isPOC: isPOC,
        teams: teams,
        colorScheme: userRole == UserRole.volunteer
            ? volunteerColorScheme
            : organizerColorScheme);
  }
}
