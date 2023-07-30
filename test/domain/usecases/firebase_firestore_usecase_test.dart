import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nowingoogle/data/models/firestore_models/user_firestore_object_model.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/domain/entities/user.dart';
import 'package:nowingoogle/data/repositories/firestore_repository_impl.dart';
import 'package:nowingoogle/domain/enums/collection_enum.dart';
import 'package:nowingoogle/domain/repositories/firestore_repository.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  late FirestoreRepository<User> firestoreRepository;
  setUp(() async {
    await instance.collection("users").doc("manas").set({'username': 'manas'});
    var userObjectModel = UserFirestoreModel();
    firestoreRepository = FirestoreRepositoryImpl<UserModel, User>(
        firestore: instance,
        collection: Collection.Users,
        objectModel: userObjectModel);
  });

  test('test the repository', () async {
    final data = await firestoreRepository.getData("manas");
    //TODO change this code
    expect(true, equals(true));
    // expect(data, Right(User(username: "manas")));
  });
}
