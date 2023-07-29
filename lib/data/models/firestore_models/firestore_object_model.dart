import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/domain/entities/user_class.dart';

abstract class FirestoreObjectModel<P, Q> {
  Either<Failure, P> getModelFromDocumentSnapshot(
      DocumentSnapshot documentSnapshot);
  Map<String, dynamic> toJson(Q data);
  Q toEntity(P model);
}
