import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../failure.dart';
import '../../../domain/entities/user_class.dart';
import '../user_model.dart';
import 'firestore_object_model.dart';

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
