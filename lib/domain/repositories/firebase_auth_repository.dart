import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/failure.dart';

abstract class FirebaseAuthRepository {
  bool get isLoggedIn;
  User? get currentUser;
  Future<Either<Failure, bool>> linkWithFirebase(OAuthCredential credential);
}
