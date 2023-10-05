import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/domain/entities/speaker.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';

class SpeakerModel extends UserModel {
  final String talkTitle;
  final int talkTime;

  const SpeakerModel({
    super.userRole = UserRole.speaker,
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
    required this.talkTitle,
    required this.talkTime,
  });

  factory SpeakerModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      SpeakerModel(
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
        talkTitle: snapshot.get("talkTitle"),
        talkTime: snapshot.get("talkTime"),
      );
  @override
  Map<String, dynamic> toJson() {
    return super.toJson()
      ..addAll({"talkTitle": talkTitle, "talkTime": talkTime});
  }

  @override
  Speaker toEntity() {
    return Speaker(
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
        talkTitle: talkTitle,
        talkTime: talkTime,
        colorScheme: speakerColorScheme);
  }
}
