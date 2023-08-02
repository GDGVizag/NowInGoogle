import 'package:dartz/dartz.dart';
import 'package:nowingoogle/domain/repositories/get_place_repository.dart';

import '../../data/failure.dart';

class GetPlaceUseCase {
  final GetPlaceRepository placeRepository;
  const GetPlaceUseCase({required this.placeRepository});
  Future<Either<Failure, String>> getAddressFromPincode(int pincode) async {
    return placeRepository.getPlaceFromPincode(pincode);
  }
}
