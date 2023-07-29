import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/models/firestore_models/firestore_object_model.dart';
import 'package:nowingoogle/data/utils/collection_utils.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// [P] - Model class
///
/// [Q] - Entity class
class FirestoreRepositoryImpl<P, Q> implements FirestoreRepository<Q> {
  final FirestoreObjectModel<P, Q> objectModel;
  final FirebaseFirestore firestore;
  final Collection collection;
  const FirestoreRepositoryImpl(
      {required this.firestore,
      required this.collection,
      required this.objectModel});
  @override
  Future<Either<Failure, Q>> getData(String documentId) async {
    final documentSnapshot = await firestore
        .collection(CollectionUtils.getCollectionPath(collection))
        .doc(documentId)
        .get();
    final model = objectModel.getModelFromDocumentSnapshot(documentSnapshot);
    return model.fold<Either<Failure, Q>>(
      (l) => Left(l),
      (r) => Right(objectModel.toEntity(r)),
    );
  }

  @override
  Future<Either<Failure, void>> putData(data, {String? documentId}) async {
    try {
      await firestore
          .collection(CollectionUtils.getCollectionPath(collection))
          .doc(documentId)
          .set(objectModel.toJson(data));
      return const Right(null);
    } on SocketException {
      return const Left(Failure(message: 'Socket Exception'));
    } on FirebaseException {
      return const Left(Failure(message: 'Firebase Exception'));
    }
  }

  @override
  Future<Either<Failure, void>> updateData(String documentId, data) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
