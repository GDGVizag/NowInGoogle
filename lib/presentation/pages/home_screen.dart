import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_events.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_user_states.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_avatar_image.dart';
import 'package:nowingoogle/presentation/layouts/story/story_carousel.dart';
import 'package:nowingoogle/presentation/pages/widgets/event_announcement.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/around_you_section.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/interests_selection_screen.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/top_events_carousel.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/top_reads_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userState = 3;
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
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.search),
          ),
          const SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('chat');
            },
            icon: const Icon(FeatherIcons.send),
          ),
          const SizedBox(
            width: 12,
          ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 12,
            ),
            EventAnnouncementBanner(
              event: events[2].toEntity(),
              isEventNamePlural: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 100,
                    child: OverflowBox(
                        maxHeight: 100,
                        maxWidth: MediaQuery.of(context).size.width,
                        child: const StoryCarousel()),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TopEventsCarousel(),
                  const SizedBox(
                    height: 24,
                  ),
                  const AroundYouSection(),
                  const SizedBox(
                    height: 24,
                  ),
                  const InterestsSelectionSection(),
                  const SizedBox(
                    height: 24,
                  ),
                  const TopReadsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
