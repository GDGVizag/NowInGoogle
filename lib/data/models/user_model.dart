import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:nowingoogle/domain/entities/user.dart';

class UserModel extends Equatable {
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
  final String bio;
  final List<String> interests;
  final List<String> blogs;
  final List<String> posts;
  final List<String> events;
  final List<String> followers;
  final List<String> following;
  final bool verified;
  final int strikes;
  final bool blacklisted;

  const UserModel({
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
    required this.bio,
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
  // TODO: implement props
  List<Object?> get props => [username];

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      UserModel(
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
          bio: snapshot.get("bio"),
          interests: snapshot.get("interests"),
          //How to do we include blogs
          blogs: snapshot.get("blogs"),
          //How to do we include posts
          posts: snapshot.get("posts"),
          events: snapshot.get("events"),
          followers: snapshot.get("followers"),
          following: snapshot.get("following"),
          verified: snapshot.get("verified"),
          strikes: snapshot.get("strikes"),
          blacklisted: snapshot.get("blacklisted"));

  Map<String, dynamic> toJson() {
    return {};
  }

  User toEntity() => User(
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
      bio: bio,
      interests: interests,
      blogs: blogs,
      posts: posts,
      events: events,
      followers: followers,
      following: following,
      verified: verified,
      strikes: strikes,
      blacklisted: blacklisted);
}