import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nowingoogle/data/failure.dart';

abstract class GoogleAuthRepository {
  Future<Either<Failure, OAuthCredential>> signIn();
}
