import 'package:flutter/material.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/pages/temp/user_data.dart';

final userdata = [
  const UserData(
    fullName: "Manas Malla",
    name: "manas_malla",
    image: "https://avatars.githubusercontent.com/u/38750492?v=4",
    hasActiveStory: true,
    userRole: UserRole.speaker,
  ),
  UserData(
      fullName: "బాల త్రిపుర సుందరి",
      name: "bala_vemulakonda",
      image:
          "https://raw.githubusercontent.com/ManasMalla/WhatsApp/main/app/src/main/res/drawable/bala_tripura_sundari_vemulakonda.jpg",
      hasActiveStory: true,
      userRole: UserRole.organizer,
      messages: [
        Message(
          message: "Tug of war baga jaruguthudha akkoi!",
          poster: "manasmalla",
          timestamp: DateTime.now()
              .subtract(const Duration(minutes: 10))
              .microsecondsSinceEpoch,
        )
      ]),
  UserData(
    fullName: "Sampath Balivada",
    name: "sampath_balivada",
    image:
        "https://pbs.twimg.com/profile_images/1651092489443610624/9JA2O0DG_400x400.jpg",
    hasActiveStory: true,
    userRole: UserRole.organizer,
    messages: [
      Message(
          message: "Mentioned you in a story",
          poster: "sampath_balivada",
          timestamp: DateTime.now()
              .subtract(const Duration(hours: 11))
              .microsecondsSinceEpoch)
    ],
  ),
  UserData(
      fullName: "Geethika Chadaram",
      name: "gee.thika_",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/geetika.jpg",
      hasActiveStory: true,
      messages: [
        Message(
            message: "Manas, could you checkout the Firestore API",
            poster: "gee.thika_",
            timestamp: DateTime.now()
                .subtract(const Duration(hours: 5, minutes: 5))
                .microsecondsSinceEpoch),
        Message(
            message: "I've tested out the API and it works fine",
            poster: "manas_malla",
            timestamp: DateTime.now()
                .subtract(const Duration(hours: 5))
                .microsecondsSinceEpoch),
        Message(
            message: "Oh ok, could you share some sample code?",
            poster: "gee.thika_",
            timestamp: DateTime.now()
                .subtract(const Duration(hours: 4, minutes: 30))
                .microsecondsSinceEpoch),
        Message(
            message: "https://docs.firebase.com/firestore",
            poster: "manas_malla",
            timestamp: DateTime.now()
                .subtract(const Duration(hours: 4))
                .microsecondsSinceEpoch),
        Message(
            message: "Thank you. I'll check it out",
            poster: "gee.thika_",
            timestamp: DateTime.now()
                .subtract(const Duration(hours: 3, minutes: 30))
                .microsecondsSinceEpoch),
      ],
      userRole: UserRole.volunteer),
  UserData(
    fullName: "Sundar Pichai",
    name: "sundar_pichai",
    image:
        "https://static.toiimg.com/thumb/resizemode-4,msid-72377199,width-1200,height-900/72377199.jpg",
    hasActiveStory: false,
    userRole: UserRole.organizer,
    messages: [
      Message(
          message: "What's the status of the Now in Google app?",
          poster: "sundar_pichai",
          timestamp: DateTime.now()
              .subtract(const Duration(hours: 23))
              .microsecondsSinceEpoch)
    ],
  ),
  UserData(
    fullName: "Lochan Mathukumilli",
    name: "lochan_m",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/lochan.jpg",
    hasActiveStory: false,
    messages: [
      Message(
          message: "Mentioned you in a story",
          poster: "sampath_balivada",
          timestamp: DateTime.now()
              .subtract(const Duration(hours: 11))
              .microsecondsSinceEpoch)
    ],
  ),
  const UserData(
    fullName: "Srinidhi Chitti",
    name: "srindhi_chitti",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/nidhi.jpg",
    hasActiveStory: false,
  ),
  UserData(
    fullName: "Mohan Satya Kommana",
    name: "mohan_satya",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/mohan.jpg",
    hasActiveStory: false,
    messages: [
      Message(
          message: "How do we use firebase_core",
          poster: "mohan_satya",
          timestamp: DateTime.now()
              .subtract(const Duration(hours: 16))
              .microsecondsSinceEpoch)
    ],
  ),
  UserData(
    fullName: "Satwik Varma",
    name: "satwik_varma",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/satwik.jpeg",
    hasActiveStory: false,
    messages: [
      Message(
          message: "I've tested out the API and it works fine",
          poster: "manas_malla",
          timestamp: DateTime.now()
              .subtract(const Duration(days: 2))
              .microsecondsSinceEpoch)
    ],
  ),
];

class StoryCarousel extends StatelessWidget {
  const StoryCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return StoryProfile(
              user: userdata[index],
              primaryColor: userdata[index].userRole == UserRole.volunteer
                  ? Colors.blue.shade800
                  : userdata[index].userRole == UserRole.organizer
                      ? Colors.red.shade700
                      : userdata[index].userRole == UserRole.speaker
                          ? const Color(0xFF34A853)
                          : Colors.amber.shade700,
            );
          },
          separatorBuilder: (context, _) {
            return const SizedBox(
              width: 8,
            );
          },
          itemCount: userdata.length),
    );
  }
}

class StoryProfile extends StatelessWidget {
  final UserData user;
  final Color primaryColor;
  const StoryProfile({
    Key? key,
    required this.user,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              Navigator.of(context).pushNamed("story", arguments: user),
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: user.hasActiveStory
                    ? LinearGradient(colors: [
                        // Theme.of(context).colorScheme.primary,
                        // Theme.of(context).colorScheme.primary.withOpacity(0.8),
                        primaryColor,
                        primaryColor.withOpacity(0.8),
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft)
                    : null,
                color: user.hasActiveStory ? null : Colors.grey.shade300,
                shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle),
              child: Container(
                margin: const EdgeInsets.all(3),
                child: ClipOval(
                  child: Image.network(
                    user.image,
                    height: 54,
                    width: 54,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.color
                          ?.withOpacity(user.hasActiveStory ? 1 : 0.3)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: user.name.length >= 9 ? 0 : 4,
              ),
              user.userRole != UserRole.attendee
                  ? Icon(Icons.verified,
                      size: 12,
                      color: user.hasActiveStory
                          ? Colors.blue.shade700
                          : Colors.blue.shade100)
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
