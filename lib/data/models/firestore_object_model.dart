import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/models/user_class.dart';

abstract class FirestoreObjectModel<P, Q> {
  Either<Failure, P> getModelFromDocumentSnapshot(
      DocumentSnapshot documentSnapshot);
  Map<String, dynamic> toJson(Q data);
  Q toEntity(P model);
}

class UserFirestoreModel implements FirestoreObjectModel<UserModel, User> {
  @override
  Either<Failure, UserModel> getModelFromDocumentSnapshot(
      DocumentSnapshot snapshot) {
    return Right(UserModel(username: snapshot.get("username")));
  }

  @override
  Map<String, dynamic> toJson(User data) {
    return {
      "username": data.username,
    };
  }

  @override
  User toEntity(UserModel model) {
    return model.toEntity();
  }
}
