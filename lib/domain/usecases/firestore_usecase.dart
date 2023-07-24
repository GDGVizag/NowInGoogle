import 'package:dartz/dartz.dart';

import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/domain/entities/user.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';

class FirestoreUsecase<T> {
  final Collection collectionType;
  final FirestoreRepository<T> firestoreRepository;
  const FirestoreUsecase(
      {required this.collectionType, required this.firestoreRepository});

  ///A simple method to get data from the Firebase Firestore database given the documentId from the `FirebaseRepository<T>`
  ///
  /// [documentId]: the unique id of the document you wish to get
  /// Returns a type of [T]
  Future<Either<Failure, T>> getData(String documentId) {
    return firestoreRepository.getData(documentId);
  }

  Future<Either<Failure, bool>> putData(T data, String? documentId) {
    return firestoreRepository.putData(data, documentId: documentId);
  }

  Future<Either<Failure, bool>> updateData(String documentId, T data) {
    return firestoreRepository.updateData(documentId, data);
  }
}
