import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/datasources/get_place_datasource.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/server_exception.dart';
import 'package:nowingoogle/domain/repositories/get_place_repository.dart';

class GetPlaceRepositoryImpl implements GetPlaceRepository {
  final GetPlaceDataSource dataSource;
  const GetPlaceRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, String>> getPlaceFromPincode(int pincode) async {
    try {
      final result = await dataSource.getCityFromPincode(pincode);
      String city = result["Division"] ?? "India";
      return Right(city);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return const Left(
          Failure(message: "Oops. You're not connected to the internet."));
    }
  }
}
