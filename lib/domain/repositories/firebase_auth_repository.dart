import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/failure.dart';

abstract class FirebaseAuthRepository {
  Future<Either<Failure, bool>> linkWithFirebase(OAuthCredential credential);
}
