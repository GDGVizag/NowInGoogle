import 'package:flutter/material.dart';
import 'package:nowingoogle/data/models/speaker_model.dart';
import 'package:nowingoogle/data/models/user_model.dart';
import 'package:nowingoogle/data/models/volunteer_model.dart';
import 'package:nowingoogle/domain/enums/social_platforms.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/pages/layouts/profile/profile_avatar_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Attendee
    const attendeeState = UserModel(
        firstName: "Manas",
        lastName: "Malla",
        username: "manasmalla",
        avatar:
            "https://lh3.googleusercontent.com/a-/AD_cMMRCMJY__VrfIfVCEK97uQajGP0zqKaglxHWtOF0zw",
        career: "student",
        gender: "male",
        bio:
            "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
        email: "me@manasmalla.dev",
        phone: "9059145216",
        organization: "GITAM University",
        place: "Visakhapatnam");

    //Volunteer
    const volunteerState = VolunteerModel(
      firstName: "Manas",
      lastName: "Malla",
      username: "manasmalla",
      avatar:
          "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/manas_malla.png?raw=true",
      isPOC: true,
      career: "intern",
      gender: "male",
      handles: {SocialPlatform.instagram: "ManasMalla-Dev"},
      bio:
          "Life is too short and beautiful!\nKeep making miracles and let’s enjoy what life throws at us, the lows and the highs with the same enthusiastic spirit and a bright smile 😃 !",
      email: "manas@spotmies.com",
      phone: "9100162652",
      organization: "Spotmies LLP",
      place: "Visakhapatnam",
      teams: [
        "registration",
      ],
    );

    //Organizer
    const organizerState = VolunteerModel(
      userRole: UserRole.organizer,
      firstName: "Aarogya",
      lastName: "Tatineni",
      username: "aarogyatatineni",
      avatar:
          "https://github.com/ManasMalla/WhatsApp/blob/main/app/src/main/res/drawable/mrs_manas_malla.png?raw=true",
      career: "doctor",
      gender: "female",
      handles: {
        SocialPlatform.twitter: "AarogyaTatineni",
      },
      bio:
          "May God protect us. Let’s all be content together as our content lies in our family, #VasudaivaKutumbam 🦚 🐚☀. Let’s try to help each other. Let our lives be full of divine energy. May we feel no enmity or jealousy towards others.\nLet there be peace. ✌️!✌️!",
      email: "me@aarogya.dev",
      phone: "9492939115",
      organization: "AUM College",
      place: "Visakhapatnam",
      teams: [],
      isPOC: true,
    );

    //Speaker
    const speakerState = SpeakerModel(
        firstName: "Malla",
        lastName: "Malla",
        username: "manasmalla",
        avatar:
            "https://play-lh.googleusercontent.com/LTFNtvRVpXyvFW6NuWG453hxxv_kDrvMuf7BU-jr2fyM5Ylktsib3lxId__ragB-ydI4",
        career: "Camp Leader",
        gender: "male",
        handles: {
          SocialPlatform.linkedIn: "ManasMalla",
        },
        bio:
            "Composing experiences for everyone for a range of screens. Navigated via Layout Lakes, hiked the Performance Peaks, migrated across the Migration Meadows, while Testing trails and camped at Material Tents. Best of Stargazing at State!\nSee you on the Compose Trail!",
        talkTime: 30,
        talkTitle: "the all new, Android Studio: Bot",
        email: "speaker@manasmalla.dev",
        phone: "9059145216",
        organization: "GDG Vizag",
        place: "Visakhapatnam");
    var userStates = [
      attendeeState,
      volunteerState,
      organizerState,
      speakerState
    ];

    var userState = 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        centerTitle: false,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('profile',
                    arguments: userStates[userState].toEntity());
              },
              child: ProfileAvatarImage(url: userStates[userState].avatar),
            ),
          )
        ],
      ),
    );
  }
}
