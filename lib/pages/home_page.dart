import 'package:flutter/material.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';
import 'package:nowingoogle/pages/profile_page.dart';
import 'package:nowingoogle/widgets/agenda-snippet.dart';
import 'package:nowingoogle/widgets/countdowntimer.dart';
import 'package:nowingoogle/widgets/miniwidgets.dart';
import 'package:nowingoogle/widgets/registersnippet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Attendee
    var attendeeState = const AttendeeProfileUiState(
        name: "Manas Malla",
        image:
            "https://lh3.googleusercontent.com/a-/AD_cMMRCMJY__VrfIfVCEK97uQajGP0zqKaglxHWtOF0zw",
        profession: "student",
        gender: "male",
        bio:
            "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
        email: "me@manasmalla.dev",
        phoneNumber: "9059145216",
        organization: "GITAM University",
        place: "Visakhapatnam");

    //Volunteer
    var volunteerState = const VolunteerProfileUiState(
        name: "Manas Malla",
        image:
            "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/manas_malla.png?raw=true",
        isPOC: true,
        profession: "intern",
        gender: "male",
        handle: "ManasMalla-Dev",
        bio:
            "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
        email: "manas@spotmies.com",
        phoneNumber: "9100162652",
        organization: "Spotmies LLP",
        place: "Visakhapatnam");

    //Organizer
    var organizerState = const OrganizerProfileUiState(
        name: "Aarogya Tatineni",
        image:
            "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/mrs_manas_malla.png?raw=true",
        profession: "doctor",
        gender: "female",
        handle: "AarogyaTatineni",
        bio:
            "May God protect us. Let’s all be content together as our content lies in our family, #VasudaivaKutumbam 🦚 🐚☀. Let’s try to help each other. Let our lives be full of divine energy. May we feel no enmity or jealousy towards others.\nLet there be peace. ✌️!✌️!",
        email: "me@aarogya.dev",
        phoneNumber: "9492939115",
        organization: "AUM College",
        place: "Visakhapatnam");

    //Speaker
    var speakerState = const SpeakerProfileUiState(
        name: "Manas Malla",
        image:
            "https://play-lh.googleusercontent.com/LTFNtvRVpXyvFW6NuWG453hxxv_kDrvMuf7BU-jr2fyM5Ylktsib3lxId__ragB-ydI4",
        profession: "Camp Leader",
        gender: "male",
        handle: "ManasMalla",
        bio:
            "Composing experiences for everyone for a range of screens. Navigated via Layout Lakes, hiked the Performance Peaks, migrated across the Migration Meadows, while Testing trails and camped at Material Tents. Best of Stargazing at State!\nSee you on the Compose Trail!",
        talkTime: 30,
        talkTitle: "the all new, Android Studio: Bot",
        email: "speaker@manasmalla.dev",
        phoneNumber: "9059145216",
        organization: "GDG Vizag",
        place: "Visakhapatnam");
    var userStates = [
      attendeeState,
      volunteerState,
      organizerState,
      speakerState
    ];

    var userState = 3;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(uiState: userStates[userState])));
              },
              child: ProfileImage(
                url: userStates[userState].image,
              ),
            ),
          )
        ],
      ),
      drawer: NavigationDrawer(children: [
        NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          label: Text("Home"),
          selectedIcon: Icon(Icons.home_rounded),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.question_answer_outlined),
          label: Text("FAQ"),
          selectedIcon: Icon(Icons.question_answer_rounded),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterSnippet(),
            Image.asset(
              'assets/cycle.png',
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 110.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFF202023)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(12.0)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48)
                          .copyWith(top: 24 + 120),
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: const Center(
                      child: Text("54+ attendees and still counting...")),
                ),
                CountdownTimer(
                  primaryColor: userStates[userState].primaryColor,
                  onPrimaryColor: userStates[userState].onPrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
