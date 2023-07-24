import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/utils/collection_utils.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepositoryImpl<T> implements FirestoreRepository<T> {
  final FirebaseFirestore firestore;
  final Collection collection;
  const FirestoreRepositoryImpl(
      {required this.firestore, required this.collection});
  @override
  Future<Either<Failure, T>> getData(String documentId) {
    final documentSnapshot = firestore
        .collection(CollectionUtils.getCollectionPath(collection))
        .doc(documentId)
        .get();
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
