import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';
import 'package:nowingoogle/presentation/layouts/story/story_carousel.dart';
import 'package:nowingoogle/presentation/pages/temp/user_data.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var chats =
        userdata.where((element) => element.messages.isNotEmpty).toList()
          ..sort(
            (a, b) => b.messages.last.timestamp.compareTo(
              a.messages.last.timestamp,
            ),
          );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          splashRadius: 20,
          icon: const Icon(FeatherIcons.arrowLeft),
        ),
        title: const Row(children: [
          Text("manasmalla"),
          SizedBox(
            width: 6,
          ),
          Icon(Icons.verified, color: Colors.blue, size: 16),
        ]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: "Search",
                  prefixIcon: const Icon(FeatherIcons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: OverflowBox(
                    maxHeight: 100,
                    maxWidth: MediaQuery.of(context).size.width,
                    child: const StoryCarousel()),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Messages",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Requests"),
                  ),
                ],
              ),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatListTile(
                    user: chats[index],
                    primaryColor: chats[index].userRole == UserRole.volunteer
                        ? Colors.blue.shade800
                        : chats[index].userRole == UserRole.organizer
                            ? Colors.red.shade700
                            : chats[index].userRole == UserRole.speaker
                                ? const Color(0xFF34A853)
                                : Colors.amber.shade700,
                  );
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: chats.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final UserData user;
  final Color primaryColor;
  const ChatListTile({
    super.key,
    required this.user,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("user-chat", arguments: user);
      },
      child: Row(
        children: [
          InkWell(
            onTap: () => user.hasActiveStory
                ? Navigator.of(context).pushNamed("story", arguments: user)
                : null,
            child: Container(
              margin: const EdgeInsets.all(8).copyWith(left: 0),
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
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      capitalize(
                        user.fullName.length >= 21
                            ? "${user.fullName.substring(0, 22)}.."
                            : user.fullName,
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium),
                  user.userRole != UserRole.attendee
                      ? Container(
                          decoration: BoxDecoration(
                            color: (user.userRole == UserRole.volunteer
                                    ? Colors.blue.shade800
                                    : user.userRole == UserRole.organizer
                                        ? organizerColorScheme.primary
                                        : user.userRole == UserRole.speaker
                                            ? const Color(0xFF34A853)
                                            : Colors.amber.shade700)
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            capitalize(user.userRole.name),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Text(
                "${(user.messages.lastOrNull?.message.length ?? 0) >= 30 ? ("${user.messages.lastOrNull?.message.substring(0, 31)}...") : user.messages.lastOrNull?.message ?? ""} • ${getMessageTimestamp(user.messages.last.timestamp)}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.camera),
          ),
        ],
      ),
    );
  }

  getMessageTimestamp(int timestamp) {
    final durationDifference = DateTime.fromMicrosecondsSinceEpoch(timestamp)
        .difference(DateTime.now())
        .abs();
    if (durationDifference.inDays > 0) {
      return "${durationDifference.inDays}d";
    }
    if (durationDifference.inHours > 0) {
      return "${durationDifference.inHours}h";
    }
    if (durationDifference.inMinutes > 0) {
      return "${durationDifference.inMinutes}m";
    }
    return "Just now";
  }
}
