import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_one_tap_sign_in/google_one_tap_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:http/http.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';

class HomeViewModel with ChangeNotifier {
  late PeopleServiceApi peopleServiceApi;
  TextEditingController careerController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
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
      final GoogleSignIn googleSignIn =
          GoogleSignIn(scopes: [PeopleServiceApi.userGenderReadScope]);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var client = await googleSignIn.authenticatedClient();
      peopleServiceApi = PeopleServiceApi(client!);

      var authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Once signed in, return the UserCredential
      return authResult;
    }
  }

  Future<Map<String, String>?> getAddressFromPincode() async {
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
      //TODO show the error on the textfield
      return null;
    }
  }

  Future<void> createProfile(BuildContext context) async {
    var genderApi =
        await peopleServiceApi.people.get("people/me", personFields: "genders");
    var gender = genderApi.genders?.first.value;
    var career = careerController.text;
    var organization = organizationController.text;
    var address = await getAddressFromPincode();
    var data = {
      "gender": gender,
      "career": career,
      "organization": organization,
      "address": address
    };
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(data);
    Navigator.of(context).pop();
  }
}
