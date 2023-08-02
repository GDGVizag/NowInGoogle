import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/domain/usecases/oath_usecase.dart';

import '../../data/failure.dart';
import '../repositories/google_auth_repository.dart';

class GoogleOneTapAuthUseCase implements OAuthUseCase {
  final GoogleAuthRepository googleOneTapAuthRepository;
  const GoogleOneTapAuthUseCase({required this.googleOneTapAuthRepository});

  @override
  Future<Either<Failure, OAuthCredential>> signInUser() {
    return googleOneTapAuthRepository.signIn();
  }
}
