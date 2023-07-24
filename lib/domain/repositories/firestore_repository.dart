import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';

abstract class FirestoreRepository<T> {
  Future<Either<Failure, T>> getData(String documentId);
  Future<Either<Failure, bool>> putData(T data, {String? documentId});
  Future<Either<Failure, bool>> updateData(String documentId, T data);
}
