// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:nowingoogle/viewmodels/HomeViewModel.dart';

// class MockFirestore extends Mock implements FirebaseFirestore {}

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// main() {
//   var homeViewModel = HomeViewModel();
//   test('test create profile', () {
//     var mockFirestore = MockFirestore();
//     var mockFirebaseAuth = MockFirebaseAuth();
//     when(mockFirebaseAuth.currentUser?.uid).thenReturn("uid");
//     when(mockFirestore.collection("user").doc("uid").set({}))
//         .thenAnswer((realInvocation) {
//       return Future(() => {});
//     });
//     homeViewModel.createProfile(mockFirestore, mockFirebaseAuth, () {});
//   });
// }
