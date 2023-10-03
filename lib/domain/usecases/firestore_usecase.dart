import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/callbacks.dart';

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

  Future<Either<Failure, void>> putData(P data, String? documentId,
      {required OnSuccessCallbackListener onSuccessCallbackListener}) {
    return firestoreRepository.putData(data,
        documentId: documentId,
        onSuccessCallbackListener: onSuccessCallbackListener);
  }

  Future<Either<Failure, void>> updateData(String documentId, P data,
      {required OnSuccessCallbackListener onSuccessCallbackListener}) {
    return firestoreRepository.updateData(documentId, data,
        onSuccessCallbackListener: onSuccessCallbackListener);
  }

  Future<Either<Failure, List<P>>> queryData(String key, String value) {
    return firestoreRepository.queryData(key, value);
  }

  Future<Either<Failure, int>> queryDataCount(String key, String value) {
    return firestoreRepository.queryDataCount(key, value);
  }
}
