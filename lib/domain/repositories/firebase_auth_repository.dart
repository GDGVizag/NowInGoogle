import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/failure.dart';

abstract class FirebaseAuthRepository {
  Future<Either<Failure, bool>> linkWithFirebase(OAuthCredential credential);
}
