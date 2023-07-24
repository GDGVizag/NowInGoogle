import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';

abstract class FirestoreObjectModel<T, P> {
  Either<Failure, T> getModelFromDocumentSnapsot();
  Map<String, dynamic> toJson(P data);
  P toEntity(T model);
}

class UserModel<T, P> implements FirestoreObjectModel<T, P> {
  @override
  Either<Failure, T> getModelFromDocumentSnapsot() {
    // TODO: implement getModelFromDocumentSnapsot
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(P data) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
    P toEntity(T model) {
      // TODO: implement toEntity
      throw UnimplementedError();
    }
}
