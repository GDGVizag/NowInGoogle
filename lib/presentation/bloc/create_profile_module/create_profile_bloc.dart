import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowingoogle/data/callbacks.dart';
import 'package:nowingoogle/domain/usecases/create_profile_usecase.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_event.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_state.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  final CreateProfileUseCase createProfileUseCase;
  final FirebaseAuth firebaseAuth;
  CreateProfileBloc(
      {required this.createProfileUseCase, required this.firebaseAuth})
      : super(CreateProfileFormState()) {
    on<OnCreateProfile>((event, emit) async {
      // emit(CreateProfileLoading());
      var pincode = int.tryParse(event.pincode);
      if (pincode == null) {
        emit(const CreateProfileError(
            pincodeError: "Pincode is not a valid numeric value"));
        return;
      }
      if (firebaseAuth.currentUser == null) {
        emit(const CreateProfileError(error: "User is not logged in"));
        return;
      }
      final result = await createProfileUseCase.createProfile(
        firebaseAuth.currentUser!,
        username: event.username,
        gender: event.gender,
        pincode: pincode,
        career: event.career,
        organization: event.organization,
        onSuccessCallbackListener: OnSuccessCallbackListener(
          onSuccess: () {
            emit(CreateProfileSuccess());
          },
        ),
      );
      result.fold((failure) {
        emit(CreateProfileError(error: failure.message));
      }, (r) => null);
    });
    on<OnValidateUsername>(
      (event, emit) async {
        final result =
            await createProfileUseCase.validateUsername(event.username);
        result.fold(
          (failure) {
            emit(
              CreateProfileError(usernameError: failure.message),
            );
          },
          (isUsernameValidated) {
            emit(
              CreateProfileFormState(isUsernameValidated: isUsernameValidated),
            );
          },
        );
      },
    );
    on<OnUsernameValidationStatusReset>((event, emit) {
      emit(
        CreateProfileFormState(
          isUsernameValidated: UsernameStatus.notValidated,
        ),
      );
    });
  }
}
