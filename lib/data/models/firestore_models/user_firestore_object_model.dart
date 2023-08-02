import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../failure.dart';
import '../../../domain/entities/user.dart';
import '../user_model.dart';
import 'firestore_object_model.dart';

class UserFirestoreModel implements FirestoreObjectModel<UserModel, User> {
  @override
  Either<Failure, UserModel> getModelFromDocumentSnapshot(
      DocumentSnapshot snapshot) {
    return Right(UserModel.fromDocumentSnapshot(snapshot));
  }

  @override
  Map<String, dynamic> toJson(UserModel data) => data.toJson();

  @override
  User toEntity(UserModel model) => model.toEntity();

  @override
  UserModel fromEntity(User entity) => UserModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      username: entity.username,
      email: entity.email,
      phone: entity.phone,
      age: entity.age,
      gender: entity.gender,
      place: entity.place,
      career: entity.career,
      organization: entity.organization,
      avatar: entity.avatar,
      bio: entity.bio,
      handles: entity.handles,
      interests: entity.interests,
      blogs: entity.blogs,
      posts: entity.posts,
      events: entity.events,
      followers: entity.followers,
      following: entity.following,
      verified: entity.verified,
      strikes: entity.strikes,
      blacklisted: entity.blacklisted);
}
