import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:nowingoogle/data/failure.dart';

import '../../domain/repositories/google_auth_repository.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  final GoogleSignIn googleSignIn;
  const GoogleAuthRepositoryImpl({required this.googleSignIn});

  @override
  Future<Either<Failure, OAuthCredential>> signIn() async {
    try {
      final request = await googleSignIn.signIn();
      final auth = await request?.authentication;
      if (auth == null) {
        return const Left(
            Failure(message: "Oops! Failed to retrive credentials."));
      } else {
        final OAuthCredential credential = GoogleAuthProvider.credential(
            idToken: auth.idToken, accessToken: auth.accessToken);
        return Right(credential);
      }
    } on SocketException {
      return const Left(Failure(message: "Internet Not Connected"));
    } on Exception {
      return const Left(Failure(message: "Oops! Please try after some time."));
    }
  }
}
