import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/domain/usecases/oath_usecase.dart';

import '../../data/failure.dart';
import '../repositories/google_auth_repository.dart';

class GoogleAuthUseCase implements OAuthUseCase {
  final GoogleAuthRepository googleAuthRepository;
  const GoogleAuthUseCase({required this.googleAuthRepository});

  @override
  Future<Either<Failure, OAuthCredential>> signInUser() {
    return googleAuthRepository.signIn();
  }
}