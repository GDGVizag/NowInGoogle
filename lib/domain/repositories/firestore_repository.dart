import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';

abstract class FirestoreRepository<T> {
  Future<Either<Failure, T>> getData(String documentId);
  Future<Either<Failure, void>> putData(T data, {String? documentId});
  Future<Either<Failure, void>> updateData(String documentId, T data);
}