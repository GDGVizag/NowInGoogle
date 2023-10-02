import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/domain/repositories/firebase_auth_repository.dart';
import 'package:nowingoogle/domain/usecases/oath_usecase.dart';

import '../../data/failure.dart';

class FirebaseAuthUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;
  final OAuthUseCase oAuthUseCase;
  const FirebaseAuthUseCase(
      {required this.firebaseAuthRepository, required this.oAuthUseCase});

  bool get isLoggedIn => firebaseAuthRepository.isLoggedIn;

  User? get currentUser => firebaseAuthRepository.currentUser;

  Future<Either<Failure, bool>> signInUser() async {
    final credential = await oAuthUseCase.signInUser();
    return credential.fold((l) => Left(l),
        (r) async => await firebaseAuthRepository.linkWithFirebase(r));
  }
}
