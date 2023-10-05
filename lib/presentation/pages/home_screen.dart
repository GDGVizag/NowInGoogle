import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_blogs.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_events.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_user_states.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_avatar_image.dart';
import 'package:nowingoogle/presentation/layouts/story/story_carousel.dart';
import 'package:nowingoogle/presentation/pages/widgets/event_announcement.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/around_you_section.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/interests_selection_screen.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_card_top.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_recommendations_from_network.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_card.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/top_events_carousel.dart';

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
            onPressed: () {},
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
                  const StoryCarousel(),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Reads",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top stories just for you. Read them now!",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const PostCardTop(),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return PostCard(post: blogs[index]);
                    },
                    separatorBuilder: (context, index) {
                      return index % 3 == 2
                          ? const PostRecommendationsFromNetwork()
                          : const SizedBox(
                              height: 16,
                            );
                    },
                    itemCount: blogs.length,
                    primary: false,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
