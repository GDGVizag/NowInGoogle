import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/failure.dart';

abstract class GetPlaceRepository {
  Future<Either<Failure, String>> getPlaceFromPincode(int pincode);
}
