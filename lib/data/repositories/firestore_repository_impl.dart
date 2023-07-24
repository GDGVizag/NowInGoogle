import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/models/firestore_object_model.dart';
import 'package:nowingoogle/data/utils/collection_utils.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// [P] - Model class
///
/// [Q] - Entity class
///
/// [T] implements [FirestoreObjectModel<P,Q>]
class FirestoreRepositoryImpl<P, Q, T extends FirestoreObjectModel<P, Q>>
    implements FirestoreRepository<Q> {
  final FirebaseFirestore firestore;
  final Collection collection;
  const FirestoreRepositoryImpl(
      {required this.firestore, required this.collection});
  @override
  Future<Either<Failure, Q>> getData(String documentId) async {
    final documentSnapshot = await firestore
        .collection(CollectionUtils.getCollectionPath(collection))
        .doc(documentId)
        .get();
    print(T.runtimeType);
    final model = (T as FirestoreObjectModel<P, Q>)
        .getModelFromDocumentSnapshot(documentSnapshot);
    return model.fold<Either<Failure, Q>>(
      (l) => Left(l),
      (r) => Right((T as FirestoreObjectModel<P, Q>).toEntity(r)),
    );
  }

  @override
  Future<Either<Failure, bool>> putData(data, {String? documentId}) async {
    try {
      // await firestore
      //     .collection(CollectionUtils.getCollectionPath(collection))
      //     .doc(documentId)
      //     .update();
      return Right(true);
    } on SocketException {
      throw Failure(message: 'Socket Exception');
    } on FirebaseException {
      throw Fail('Firebase Exception');
    }
  }

  @override
  Future<Either<Failure, bool>> updateData(String documentId, data) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
