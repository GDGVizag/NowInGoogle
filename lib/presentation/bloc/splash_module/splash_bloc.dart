import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowingoogle/domain/usecases/firebase_auth_usecase.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_event.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_state.dart';
import 'package:nowingoogle/presentation/injector.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FirebaseAuthUseCase firebaseAuthUseCase;
  SplashBloc({required this.firebaseAuthUseCase}) : super(SplashLoading()) {
    on<OnAppInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2), () {
        final isLoggedIn = firebaseAuthUseCase.isLoggedIn;
        if (isLoggedIn) {
          emit(SplashUserAvailable());
        } else {
          if (!Platform.isAndroid) {
            emit(SplashUserLoggedOut());
          } else {
            add(const OnSignInWithGoogle());
          }
        }
      });
    });

    on<OnSignInWithGoogle>((event, emit) async {
      final result = await Injector.firebaseAuthUseCase.signInUser();
      result.fold((failure) {
        emit(SplashError(error: failure.message));
      }, (isNewUser) {
        if (isNewUser) {
          emit(SplashNewUser());
        } else {
          emit(SplashUserAvailable());
        }
      });
    });
  }
}
