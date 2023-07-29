import 'package:dartz/dartz.dart';

import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';

class FirestoreUsecase<P> {
  final Collection collectionType;
  final FirestoreRepository<P> firestoreRepository;
  const FirestoreUsecase(
      {required this.collectionType, required this.firestoreRepository});

  ///A simple method to get data from the Firebase Firestore database given the documentId from the `FirebaseRepository<T>`
  ///
  /// [documentId]: the unique id of the document you wish to get
  /// Returns a type of [P]
  Future<Either<Failure, P>> getData(String documentId) {
    return firestoreRepository.getData(documentId);
  }

  Future<Either<Failure, void>> putData(P data, String? documentId) {
    return firestoreRepository.putData(data, documentId: documentId);
  }

  Future<Either<Failure, void>> updateData(String documentId, P data) {
    return firestoreRepository.updateData(documentId, data);
  }
}
