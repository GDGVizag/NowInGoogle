import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/failure.dart';

abstract class OAuthUseCase {
  Future<Either<Failure, OAuthCredential>> signInUser();
}
