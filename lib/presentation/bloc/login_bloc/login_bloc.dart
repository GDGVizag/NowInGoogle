import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowingoogle/domain/usecases/firebase_auth_usecase.dart';
import 'package:nowingoogle/presentation/bloc/login_bloc/login_event.dart';
import 'package:nowingoogle/presentation/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthUseCase _firebaseAuthUseCase;
  LoginBloc(this._firebaseAuthUseCase) : super(IsLoggedOut()) {
    on<OnAppInitialized>((event, emit) {
      switch (event.) {
        case value:
          
          break;
        default:
      }
    });
  }
}
