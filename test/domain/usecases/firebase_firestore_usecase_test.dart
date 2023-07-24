import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nowingoogle/data/models/firestore_object_model.dart';
import 'package:nowingoogle/data/models/user_class.dart';
import 'package:nowingoogle/data/repositories/firestore_repository_impl.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  late FirestoreRepository<User> firestoreRepository;
  setUp(() async {
    await instance.collection("users").doc("manas").set({'username': 'manas'});
    firestoreRepository =
        FirestoreRepositoryImpl<UserModel, User, UserFirestoreModel>(
            firestore: instance, collection: Collection.Users);
  });

  test('test the repository', () async {
    final data = await firestoreRepository.getData("manas");
    expect(data, Right({"username": "manas"}));
  });
}
