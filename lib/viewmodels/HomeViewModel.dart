import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_one_tap_sign_in/google_one_tap_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:http/http.dart';

enum ProfileBottomSheetState { INIT, LOADING, ERROR }

class HomeViewModel with ChangeNotifier {
  ProfileBottomSheetState profileSheetState = ProfileBottomSheetState.INIT;

  TextEditingController careerController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  String? pincodeErrorText = null;
  TextEditingController pincodeController = TextEditingController();

  Future<UserCredential?> signIn() async {
    if (Platform.isAndroid) {
      var data = await GoogleOneTapSignIn.startSignIn(
          webClientId:
              "1010379975924-uu04sdp61suebvkkvshj7vgbcu4aami2.apps.googleusercontent.com");
      final credential = GoogleAuthProvider.credential(
        idToken: data?.idToken,
      );
      var authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      return authResult;
    } else {
      // Trigger the authentication flow
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        PeopleServiceApi.userGenderReadScope,
        PeopleServiceApi.userBirthdayReadScope
      ]);
      try {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        // Obtain the auth details from the request

        // var client = await googleSignIn.authenticatedClient();
        // peopleServiceApi = PeopleServiceApi(client!);
        var authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // Once signed in, return the UserCredential
        return authResult;
        // }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<Map<String, String>?> getAddressFromPincode() async {
    pincodeErrorText = null;
    notifyListeners();
    int pincode = int.parse(pincodeController.text);
    var pincodeApiResult =
        await get(Uri.parse("https://api.postalpincode.in/pincode/$pincode"));

    Map<String, dynamic> addressJson = jsonDecode(pincodeApiResult.body)[0];
    if (addressJson["Status"] == "Success") {
      var addressEntityJson = addressJson["PostOffice"].firstWhere(
          (addressEntity) => addressEntity["Division"] != "",
          orElse: () => addressJson["PostOffice"][0]);
      var city = addressEntityJson["Division"];
      var state = addressEntityJson["State"];
      return {"city": city, "state": state};
    } else {
      print("error, $addressJson");
      pincodeErrorText = "Oops, incorrect pincode! Please check again.";
      notifyListeners();
      return null;
    }
  }

  void setLoadingState() {
    profileSheetState = ProfileBottomSheetState.LOADING;
    notifyListeners();
  }

  Future<void> createProfile(FirebaseFirestore firestore,
      FirebaseAuth firebaseAuth, Function onProfileCreated) async {
    setLoadingState();
    var address = await getAddressFromPincode();
    // var genderApi =
    // await peopleServiceApi.people.get("people/me", personFields: "genders");
    // var gender = genderApi.genders?.first.value;
    var career = careerController.text;
    var organization = organizationController.text;
    var data = {
      // "gender": gender,
      "career": career,
      "organization": organization,
      "address": address
    };
    await firestore
        .collection("user")
        .doc(firebaseAuth.currentUser?.uid)
        .set(data);
    onProfileCreated();
  }
}
