import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:nowingoogle/data/failure.dart';

import '../../domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuth auth;
  const FirebaseAuthRepositoryImpl({required this.auth});

  /// A helper method to link the `OAuthCredential` with a `FirebaseAuth` account
  ///
  /// - If there's a **network failure** or **exception** thrown from Firebase, then [Failure] is returned
  ///
  /// - If the signIn was **successful**, a [bool] is return which states whether its the user is on the platform for the **first time**.
  @override
  Future<Either<Failure, bool>> linkWithFirebase(
      OAuthCredential credential) async {
    try {
      final userCredential = await auth.signInWithCredential(credential);
      return Right(userCredential.additionalUserInfo?.isNewUser ?? true);
    } on SocketException {
      return const Left(
          Failure(message: "Oops! You're not connected to the interet"));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "account-exists-with-different-credential":
          return const Left(Failure(message: ""));
        case "invalid-credential":
          return const Left(
              Failure(message: "Expired or malformed credentials."));
        case "user-disabled":
          return const Left(Failure(message: ""));
        case "user-not-found":
          return const Left(Failure(message: ""));
        default:
          return const Left(Failure(message: ""));
      }
    }
  }
}
