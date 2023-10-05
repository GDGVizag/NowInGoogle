import 'package:flutter/material.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/pages/temp/user_data.dart';

class StoryCarousel extends StatelessWidget {
  final userdata = const [
    UserData(
      name: "manas_malla",
      image: "https://avatars.githubusercontent.com/u/38750492?v=4",
      hasActiveStory: true,
      userRole: UserRole.speaker,
    ),
    UserData(
      name: "bala_vemulakonda",
      image:
          "https://raw.githubusercontent.com/ManasMalla/WhatsApp/main/app/src/main/res/drawable/bala_tripura_sundari_vemulakonda.jpg",
      hasActiveStory: true,
      userRole: UserRole.organizer,
    ),
    UserData(
      name: "sampathbalivada",
      image:
          "https://pbs.twimg.com/profile_images/1651092489443610624/9JA2O0DG_400x400.jpg",
      hasActiveStory: true,
      userRole: UserRole.volunteer,
    ),
    UserData(
      name: "gee.tika_",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/geetika.jpg",
      hasActiveStory: true,
    ),
    UserData(
      name: "sundar_pichai",
      image:
          "https://static.toiimg.com/thumb/resizemode-4,msid-72377199,width-1200,height-900/72377199.jpg",
      hasActiveStory: false,
      userRole: UserRole.organizer,
    ),
    UserData(
      name: "lochan_m",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/lochan.jpg",
      hasActiveStory: false,
    ),
    UserData(
      name: "srindhi_chitti",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/nidhi.jpg",
      hasActiveStory: false,
    ),
    UserData(
      name: "mohan_satya",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/mohan.jpg",
      hasActiveStory: false,
    ),
    UserData(
      name: "satwik_varma",
      image:
          "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/satwik.jpeg",
      hasActiveStory: false,
    ),
  ];

  const StoryCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
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
