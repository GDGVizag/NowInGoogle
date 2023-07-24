// import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:nowingoogle/firebase_options.dart';
// import 'package:nowingoogle/models/user_profile_ui_state.dart';
// import 'package:nowingoogle/utils/capitalize.dart';
// import 'package:nowingoogle/utils/get_avatar.dart';
// import 'package:nowingoogle/utils/number_util.dart';

// void main() {
//   test("Single letter string should be capitalized", () {
//     const String value = "s";
//     const String actualValue = "S";
//     final String expectedValue = capitalize(value);
//     expect(expectedValue, actualValue);
//   });
//   test("Single word string should be capitalized", () {
//     const String value = "string";
//     const String actualValue = "String";
//     final String expectedValue = capitalize(value);
//     expect(expectedValue, actualValue);
//   });
//   test("Multiword string should be capitalized", () {
//     const String value = "string to be capitalized";
//     const String actualValue = "String To Be Capitalized";
//     final String expectedValue = capitalize(value);
//     expect(expectedValue, actualValue);
//   });
//   test("Get correct avatar image", () {
//     const volunteer = UserRole.Volunteer;
//     const speaker = UserRole.Speaker;
//     const organizer = UserRole.Organizer;
//     const attendee = UserRole.Attendee;
//     expect(getAvatarUrl(volunteer), "assets/avatar/blue.png");
//     expect(getAvatarUrl(speaker), "assets/avatar/green.png");
//     expect(getAvatarUrl(organizer), "assets/avatar/red.png");
//     expect(getAvatarUrl(attendee), "assets/avatar/yellow.png");
//   });

//   test('constructing Attendee UiState', () {
//     UserProfileUiState userProfileUiState = const UserProfileUiState(
//         name: "User",
//         image:
//             "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
//         profession: "student",
//         handle: "UserTwitter",
//         gender: "male",
//         bio: "A person who loves to code",
//         email: "attendee@gdg.dev",
//         phoneNumber: "1234567890",
//         organization: "Google Developers",
//         place: "Vizag",
//         userRole: UserRole.Attendee);
//     expect(userProfileUiState.userRole.name, 'Attendee');
//     expect(userProfileUiState.getColorScheme(), attendeeColorScheme);
//     expect(userProfileUiState.name, "User");
//     expect(userProfileUiState.image,
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80");
//     expect(userProfileUiState.profession, "student");
//     expect(userProfileUiState.handle, "UserTwitter");
//     expect(userProfileUiState.gender, "male");
//     expect(userProfileUiState.bio, "A person who loves to code");
//     expect(userProfileUiState.email, "attendee@gdg.dev");
//     expect(userProfileUiState.phoneNumber, "1234567890");
//     expect(userProfileUiState.organization, "Google Developers");
//     expect(userProfileUiState.place, "Vizag");
//     expect(userProfileUiState.isPOC, null);
//     expect(userProfileUiState.talkTime, null);
//     expect(userProfileUiState.talkTitle, null);
//   });
//   test('constructing Volunteer UiState', () {
//     UserProfileUiState userProfileUiState = const UserProfileUiState(
//         name: "User",
//         image:
//             "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
//         profession: "intern",
//         handle: "UserTwitter",
//         gender: "male",
//         bio: "A person who loves to code",
//         email: "volunteer@gdg.dev",
//         phoneNumber: "1234567890",
//         organization: "Google Developers",
//         place: "Vizag",
//         userRole: UserRole.Volunteer);
//     expect(userProfileUiState.userRole.name, 'Volunteer');
//     expect(userProfileUiState.getColorScheme(), volunteerColorScheme);
//     expect(userProfileUiState.name, "User");
//     expect(userProfileUiState.image,
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80");
//     expect(userProfileUiState.profession, "intern");
//     expect(userProfileUiState.handle, "UserTwitter");
//     expect(userProfileUiState.gender, "male");
//     expect(userProfileUiState.bio, "A person who loves to code");
//     expect(userProfileUiState.email, "volunteer@gdg.dev");
//     expect(userProfileUiState.phoneNumber, "1234567890");
//     expect(userProfileUiState.organization, "Google Developers");
//     expect(userProfileUiState.place, "Vizag");
//     expect(userProfileUiState.isPOC, null);
//     expect(userProfileUiState.talkTime, null);
//     expect(userProfileUiState.talkTitle, null);
//   });
//   test('constructing Volunteer POC UiState', () {
//     UserProfileUiState userProfileUiState = const UserProfileUiState(
//         name: "User",
//         image:
//             "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
//         profession: "intern",
//         handle: "UserTwitter",
//         gender: "male",
//         bio: "A person who loves to code",
//         email: "volunteer@gdg.dev",
//         phoneNumber: "1234567890",
//         organization: "Google Developers",
//         place: "Vizag",
//         userRole: UserRole.Volunteer,
//         isPOC: true);
//     expect(userProfileUiState.userRole.name, 'Volunteer');
//     expect(userProfileUiState.getColorScheme(), volunteerColorScheme);
//     expect(userProfileUiState.name, "User");
//     expect(userProfileUiState.image,
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80");
//     expect(userProfileUiState.profession, "intern");
//     expect(userProfileUiState.handle, "UserTwitter");
//     expect(userProfileUiState.gender, "male");
//     expect(userProfileUiState.bio, "A person who loves to code");
//     expect(userProfileUiState.email, "volunteer@gdg.dev");
//     expect(userProfileUiState.phoneNumber, "1234567890");
//     expect(userProfileUiState.organization, "Google Developers");
//     expect(userProfileUiState.place, "Vizag");
//     expect(userProfileUiState.isPOC, true);
//     expect(userProfileUiState.talkTime, null);
//     expect(userProfileUiState.talkTitle, null);
//   });
//   test('constructing Organizer UiState', () {
//     UserProfileUiState userProfileUiState = const UserProfileUiState(
//         name: "User",
//         image:
//             "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
//         profession: "entrepreneur",
//         handle: "UserTwitter",
//         gender: "male",
//         bio: "A person who loves to code",
//         email: "organizer@gdg.dev",
//         phoneNumber: "1234567890",
//         organization: "Google Developers",
//         place: "Vizag",
//         userRole: UserRole.Organizer);
//     expect(userProfileUiState.userRole.name, 'Organizer');
//     expect(userProfileUiState.getColorScheme(), organizerColorScheme);
//     expect(userProfileUiState.name, "User");
//     expect(userProfileUiState.image,
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80");
//     expect(userProfileUiState.profession, "entrepreneur");
//     expect(userProfileUiState.handle, "UserTwitter");
//     expect(userProfileUiState.gender, "male");
//     expect(userProfileUiState.bio, "A person who loves to code");
//     expect(userProfileUiState.email, "organizer@gdg.dev");
//     expect(userProfileUiState.phoneNumber, "1234567890");
//     expect(userProfileUiState.organization, "Google Developers");
//     expect(userProfileUiState.place, "Vizag");
//     expect(userProfileUiState.isPOC, null);
//     expect(userProfileUiState.talkTime, null);
//     expect(userProfileUiState.talkTitle, null);
//   });
//   test('constructing Speaker UiState', () {
//     UserProfileUiState userProfileUiState = const UserProfileUiState(
//       name: "User",
//       image:
//           "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
//       profession: "professional",
//       handle: "UserTwitter",
//       gender: "male",
//       bio: "A person who loves to code",
//       email: "speaker@gdg.dev",
//       phoneNumber: "1234567890",
//       organization: "Google Developers",
//       place: "Vizag",
//       userRole: UserRole.Speaker,
//       talkTime: 30,
//       talkTitle: "Talk Title",
//     );
//     expect(userProfileUiState.userRole.name, 'Speaker');
//     expect(userProfileUiState.getColorScheme(), speakerColorScheme);
//     expect(userProfileUiState.name, "User");
//     expect(userProfileUiState.image,
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80");
//     expect(userProfileUiState.profession, "professional");
//     expect(userProfileUiState.handle, "UserTwitter");
//     expect(userProfileUiState.gender, "male");
//     expect(userProfileUiState.bio, "A person who loves to code");
//     expect(userProfileUiState.email, "speaker@gdg.dev");
//     expect(userProfileUiState.phoneNumber, "1234567890");
//     expect(userProfileUiState.organization, "Google Developers");
//     expect(userProfileUiState.place, "Vizag");
//     expect(userProfileUiState.isPOC, null);
//     expect(userProfileUiState.talkTime, 30);
//     expect(userProfileUiState.talkTitle, "Talk Title");
//   });
//   test('format single digit number', () {
//     String digit = doubleDigit(5);
//     expect(digit, "05");
//   });
//   test('format double digit number', () {
//     String digit = doubleDigit(50);
//     expect(digit, "50");
//   });

//   test('test firebase config on Android', () {
//     var firebaseConfig = DefaultFirebaseOptions.currentPlatform;
//     expect(firebaseConfig, DefaultFirebaseOptions.android);
//   });
//   test('test firebase config on iOS', () {
//     debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
//     var firebaseConfig = DefaultFirebaseOptions.currentPlatform;
//     expect(firebaseConfig, DefaultFirebaseOptions.ios);
//   });
//   test('test firebase config on macOS', () {
//     debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
//     var firebaseConfig = DefaultFirebaseOptions.currentPlatform;
//     expect(firebaseConfig, DefaultFirebaseOptions.macos);
//   });

//   test('test firebase config on windows', () {
//     debugDefaultTargetPlatformOverride = TargetPlatform.windows;
//     expect(
//         () => DefaultFirebaseOptions.currentPlatform, throwsUnsupportedError);
//   });
//   test('test firebase config on linux', () {
//     debugDefaultTargetPlatformOverride = TargetPlatform.linux;
//     expect(
//         () => DefaultFirebaseOptions.currentPlatform, throwsUnsupportedError);
//   });
//   test('test firebase config on other platform', () {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//     expect(
//         () => DefaultFirebaseOptions.currentPlatform, throwsUnsupportedError);
//   });
// }
