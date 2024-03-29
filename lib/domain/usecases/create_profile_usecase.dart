import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/data/callbacks.dart';
import 'package:nowingoogle/data/failure.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/domain/usecases/firestore_usecase.dart';
import 'package:nowingoogle/domain/usecases/get_place_usecase.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_state.dart';

class CreateProfileUseCase {
  final GetPlaceUseCase getPlaceUseCase;
  final FirestoreUsecase firestoreUsecase;
  const CreateProfileUseCase({
    required this.getPlaceUseCase,
    required this.firestoreUsecase,
  });
  Future<Either<Failure, void>> createProfile(User firebaseUser,
      {required String username,
      required String gender,
      required int pincode,
      required String career,
      required String organization,
      required OnSuccessCallbackListener onSuccessCallbackListener}) async {
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
          userModel.toEntity(), firebaseUser.uid,
          onSuccessCallbackListener: onSuccessCallbackListener);
    });
  }

  Future<Either<Failure, UsernameStatus>> validateUsername(
      String username) async {
    final response =
        await firestoreUsecase.queryDataCount("username", username);
    return response.fold(
        (failure) => Left(failure),
        (responses) => Right(
            responses == 0 ? UsernameStatus.unique : UsernameStatus.notUnique));
  }
}
