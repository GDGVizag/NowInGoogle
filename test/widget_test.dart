// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:googleapis/appengine/v1.dart';
// import 'package:network_image_mock/network_image_mock.dart';

// import 'package:nowingoogle/main.dart';
// import 'package:nowingoogle/models/user_profile_ui_state.dart';
// import 'package:nowingoogle/utils/get_avatar.dart';
// import 'package:nowingoogle/widgets/profile/profile_banner.dart';
// import 'package:nowingoogle/widgets/profile/profile_bio.dart';
// import 'package:nowingoogle/widgets/profile/profile_header.dart';
// import 'package:nowingoogle/widgets/profile/profile_section.dart';
// import 'package:nowingoogle/widgets/profile/profile_subtitle.dart';
// import 'package:nowingoogle/widgets/profile/profile_title.dart';

// import 'package:nowingoogle/widgets/profile/profile_image.dart';
// import 'package:nowingoogle/widgets/profile/profile_user_role.dart';

// void main() {
//   // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//   //   // Build our app and trigger a frame.
//   //   await tester.pumpWidget(const MyApp());

//   //   // Verify that our counter starts at 0.
//   //   expect(find.text('0'), findsOneWidget);
//   //   expect(find.text('1'), findsNothing);

//   //   // Tap the '+' icon and trigger a frame.
//   //   await tester.tap(find.byIcon(Icons.add));
//   //   await tester.pump();

//   //   // Verify that our counter has incremented.
//   //   expect(find.text('0'), findsNothing);
//   //   expect(find.text('1'), findsOneWidget);
//   // });
//   testWidgets("test profile banner", (widgetTester) async {
//     await widgetTester.pumpWidget(
//         ProfileBanner(primaryColor: attendeeColorScheme.primaryColor));
//     var container = widgetTester.widget<Container>(find.byType(Container));
//     expect(container.color, attendeeColorScheme.primaryColor);
//   });
//   testWidgets("test profile bio with empty bio", (widgetTester) async {
//     await widgetTester.pumpWidget(const ProfileBio());
//     var sizedBoxFinder = find.byType(SizedBox);
//     var textFinder = find.byType(Text);
//     expect(sizedBoxFinder, findsOneWidget);
//     expect(textFinder, findsNothing);
//   });
//   testWidgets("test profile bio with a bio", (widgetTester) async {
//     const String bio = "A simple bio";
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileBio(
//           bio: bio,
//         ),
//       ),
//     ));
//     var sizedBoxFinder = find.byType(SizedBox);
//     var textFinder = find.text(bio);
//     expect(sizedBoxFinder, findsNothing);
//     expect(textFinder, findsOneWidget);
//   });
//   testWidgets("test profile subtitle with handle", (widgetTester) async {
//     const String handle = "UserSocial";
//     const String professional = "Profession";
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileSubtitle(
//           profession: professional,
//           gender: "male",
//           handle: handle,
//         ),
//       ),
//     ));
//     var textFinder = find.text("$professional • @$handle ");
//     expect(textFinder, findsOneWidget);
//   });
//   testWidgets("test profile subtitle without handle", (widgetTester) async {
//     const String professional = "Profession";
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileSubtitle(
//           profession: professional,
//           gender: "male",
//         ),
//       ),
//     ));
//     var textFinder = find.text("$professional ");
//     expect(textFinder, findsOneWidget);
//   });
//   testWidgets("test profile subtitle with gender as male",
//       (widgetTester) async {
//     const String handle = "UserSocial";
//     const String professional = "Profession";
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileSubtitle(
//           profession: professional,
//           gender: "male",
//           handle: handle,
//         ),
//       ),
//     ));
//     var maleTextFinder = find.text("• he/him");
//     var femaleTextFinder = find.text("• she/her");
//     expect(maleTextFinder, findsOneWidget);
//     expect(femaleTextFinder, findsNothing);
//   });
//   testWidgets("test profile subtitle with gender as female",
//       (widgetTester) async {
//     const String handle = "UserSocial";
//     const String professional = "Profession";
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileSubtitle(
//           profession: professional,
//           gender: "female",
//           handle: handle,
//         ),
//       ),
//     ));
//     var maleTextFinder = find.text("• he/him");
//     var femaleTextFinder = find.text("• she/her");
//     expect(maleTextFinder, findsNothing);
//     expect(femaleTextFinder, findsOneWidget);
//   });
//   testWidgets("test profile title as not an attendee", (widgetTester) async {
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileTitle(
//           name: "User",
//           isAttendee: false,
//         ),
//       ),
//     ));
//     var nameFinder = find.text("User");
//     expect(nameFinder, findsOneWidget);
//     var iconFinder = find.byIcon(Icons.verified);
//     expect(iconFinder, findsOneWidget);
//     var sizedBoxFinder = find.byType(SizedBox);
//     expect(sizedBoxFinder, findsWidgets);

//     var spacerFinder = find
//         .byWidgetPredicate((widget) => widget is SizedBox && widget.width == 8);
//     expect(spacerFinder, findsOneWidget);
//   });
//   testWidgets("test profile title as attendee", (widgetTester) async {
//     await widgetTester.pumpWidget(const MaterialApp(
//       home: Scaffold(
//         body: ProfileTitle(
//           name: "User",
//           isAttendee: true,
//         ),
//       ),
//     ));
//     var nameFinder = find.text("User");
//     expect(nameFinder, findsOneWidget);
//     var iconFinder = find.byIcon(Icons.verified);
//     expect(iconFinder, findsNothing);
//     var spacerFinder = find
//         .byWidgetPredicate((widget) => widget is SizedBox && widget.width == 8);
//     expect(spacerFinder, findsNothing);
//   });
//   testWidgets('test profile image', (WidgetTester widgetTester) async {
//     String url =
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80";
//     await mockNetworkImagesFor(
//         () async => await widgetTester.pumpWidget(MaterialApp(
//               home: Scaffold(
//                 body: ProfileImage(
//                   image: url,
//                   avatar: getAvatarUrl(UserRole.Attendee),
//                 ),
//               ),
//             )));
//     expect(find.byType(ClipOval), findsOneWidget);
//     expect(find.image(NetworkImage(url)), findsOneWidget);
//     expect(find.image(const AssetImage("assets/avatar/yellow.png")),
//         findsOneWidget);
//   });
//   testWidgets('test profile user role widget for attendee ',
//       (widgetTester) async {
//     await widgetTester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: ProfileUserRole(
//               userRole: UserRole.Attendee,
//               primaryColor: attendeeColorScheme.primaryColor,
//               onPrimaryColor: attendeeColorScheme.onPrimaryColor),
//         ),
//       ),
//     );
//     expect(find.byType(Row), findsWidgets);
//     var filledContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).color ==
//             attendeeColorScheme.primaryColor);
//     expect(filledContainer, findsOneWidget);
//     var borderContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).border?.bottom.color ==
//             attendeeColorScheme.primaryColor &&
//         (widget.decoration as BoxDecoration).border?.top.color ==
//             attendeeColorScheme.primaryColor);
//     expect(borderContainer, findsNothing);
//     expect(find.text("POC"), findsNothing);
//   });
//   testWidgets('test profile user role widget for a volunteer who is POC ',
//       (widgetTester) async {
//     await widgetTester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: ProfileUserRole(
//               userRole: UserRole.Volunteer,
//               isPOC: true,
//               primaryColor: volunteerColorScheme.primaryColor,
//               onPrimaryColor: volunteerColorScheme.onPrimaryColor),
//         ),
//       ),
//     );
//     expect(find.byType(Row), findsWidgets);
//     var filledContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).color ==
//             volunteerColorScheme.primaryColor);
//     expect(filledContainer, findsOneWidget);
//     var borderContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).border?.bottom.color ==
//             volunteerColorScheme.primaryColor &&
//         (widget.decoration as BoxDecoration).border?.top.color ==
//             volunteerColorScheme.primaryColor);
//     expect(borderContainer, findsNothing);
//     expect(find.text("POC"), findsOneWidget);
//   });
//   testWidgets('test profile user role widget for a organizer who is not a POC',
//       (widgetTester) async {
//     await widgetTester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: ProfileUserRole(
//               userRole: UserRole.Organizer,
//               primaryColor: organizerColorScheme.primaryColor,
//               onPrimaryColor: organizerColorScheme.onPrimaryColor),
//         ),
//       ),
//     );
//     expect(find.byType(Row), findsWidgets);
//     var filledContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).color ==
//             organizerColorScheme.primaryColor);
//     expect(filledContainer, findsOneWidget);
//     var borderContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).border?.bottom.color ==
//             organizerColorScheme.primaryColor &&
//         (widget.decoration as BoxDecoration).border?.top.color ==
//             organizerColorScheme.primaryColor);
//     expect(borderContainer, findsNothing);
//     expect(find.text("POC"), findsNothing);
//   });
//   testWidgets('test profile user role widget for a speaker',
//       (widgetTester) async {
//     await widgetTester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: ProfileUserRole(
//               userRole: UserRole.Speaker,
//               primaryColor: speakerColorScheme.primaryColor,
//               onPrimaryColor: speakerColorScheme.onPrimaryColor),
//         ),
//       ),
//     );
//     expect(find.byType(Row), findsWidgets);
//     var filledContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).color ==
//             speakerColorScheme.primaryColor);
//     expect(filledContainer, findsOneWidget);
//     var borderContainer = find.byWidgetPredicate((widget) =>
//         widget is Container &&
//         widget.decoration is BoxDecoration &&
//         (widget.decoration as BoxDecoration).border?.bottom.color ==
//             speakerColorScheme.primaryColor &&
//         (widget.decoration as BoxDecoration).border?.top.color ==
//             speakerColorScheme.primaryColor &&
//         widget.child is Text);
//     expect(borderContainer, findsOneWidget);
//     expect(find.text("POC"), findsNothing);
//   });
//   testWidgets('test ProfileSection', (widgetTester) async {
//     String name = "User";
//     String profession = "Student";
//     String gender = "male";
//     UserRole userRole = UserRole.Attendee;
//     await widgetTester.pumpWidget(MaterialApp(
//       home: Scaffold(
//         body: ProfileSection(
//             name: name,
//             profession: profession,
//             gender: gender,
//             userRole: userRole,
//             primaryColor: attendeeColorScheme.primaryColor,
//             onPrimaryColor: attendeeColorScheme.onPrimaryColor),
//       ),
//     ));
//     var columnFinder = find.byWidgetPredicate((widget) =>
//         widget is Column &&
//         widget.children
//             .where((element) =>
//                 element is ProfileTitle &&
//                 element.name == name &&
//                 element.isAttendee == (userRole == UserRole.Attendee))
//             .isNotEmpty &&
//         widget.children
//             .where((element) =>
//                 element is ProfileSubtitle &&
//                 element.handle == null &&
//                 element.gender == gender &&
//                 element.profession == profession)
//             .isNotEmpty &&
//         widget.children
//             .where((element) =>
//                 element is ProfileUserRole &&
//                 element.userRole == userRole &&
//                 element.isPOC == false &&
//                 element.primaryColor == attendeeColorScheme.primaryColor &&
//                 element.onPrimaryColor == attendeeColorScheme.onPrimaryColor)
//             .isNotEmpty &&
//         widget.children
//             .where((element) => element is ProfileBio && element.bio == null)
//             .isNotEmpty);
//     expect(columnFinder, findsOneWidget);
//   });
//   testWidgets('test Profile header', (widgetTester) async {
//     String url =
//         "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80";
//     String avatarURL = "assets/avatar/blue.png";
//     await mockNetworkImagesFor(
//       () async => await widgetTester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: ProfileHeader(
//               image: url,
//               avatar: avatarURL,
//               primaryColor: volunteerColorScheme.primaryColor,
//               onPrimaryColor: volunteerColorScheme.onPrimaryColor,
//             ),
//           ),
//         ),
//       ),
//     );
//     var columnFinder = find.byWidgetPredicate((widget) =>
//         widget is Stack &&
//         widget.children
//             .where((element) =>
//                 element is ProfileBanner &&
//                 element.primaryColor == volunteerColorScheme.primaryColor)
//             .isNotEmpty &&
//         widget.children
//             .where((element) =>
//                 element is Column &&
//                 element.children
//                     .where((columnElement) =>
//                         columnElement is Align &&
//                         columnElement.child is Padding &&
//                         (columnElement.child as Padding).child is IconButton &&
//                         ((columnElement.child as Padding).child as IconButton)
//                                 .color ==
//                             volunteerColorScheme.onPrimaryColor)
//                     .isNotEmpty &&
//                 element.children
//                     .where((columnElement) =>
//                         columnElement is ProfileImage &&
//                         columnElement.image == url &&
//                         columnElement.avatar == avatarURL)
//                     .isNotEmpty)
//             .isNotEmpty);
//     expect(columnFinder, findsOneWidget);
//   });
// }
