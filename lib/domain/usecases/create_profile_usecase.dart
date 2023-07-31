import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/domain/usecases/firestore_usecase.dart';
import 'package:nowingoogle/domain/usecases/get_place_usecase.dart';
import 'package:http/http.dart' as http;

class CreateProfileUseCase {
  final GetPlaceUseCase getPlaceUseCase;
  final FirestoreUsecase firestoreUsecase;
  const CreateProfileUseCase({
    required this.getPlaceUseCase,
    required this.firestoreUsecase,
  });
  Future<Either<Failure, void>> createProfile(
    User firebaseUser, {
    required String username,
    required String gender,
    required int pincode,
    required String career,
    required String organization,
  }) async {
    final cityResult = await getPlaceUseCase.getAddressFromPincode(pincode);
    return cityResult.fold((failure) => Left(failure), (city) async {
      UserModel userModel = UserModel(
          firstName: firebaseUser.displayName!.split(' ').first,
          lastName: firebaseUser.displayName!.split(' ').length > 1
              ? firebaseUser.displayName!.split(' ').last
              : '',
          username: username,
          email: firebaseUser.email!,
          gender: gender,
          place: city,
          career: career,
          organization: organization);

      return await firestoreUsecase.putData(
        userModel.toJson(),
        firebaseUser.uid,
      );
    });
  }
}
