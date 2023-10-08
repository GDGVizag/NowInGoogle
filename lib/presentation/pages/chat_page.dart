import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';
import 'package:nowingoogle/presentation/layouts/story/story_carousel.dart';
import 'package:nowingoogle/presentation/pages/temp/user_data.dart';

class UserChatPage extends StatelessWidget {
  const UserChatPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    final user = ModalRoute.of(context)!.settings.arguments as UserData;

    final mentions = (userdata.skip(1).take(5));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(FeatherIcons.arrowLeft),
          iconSize: 20,
        ),
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  width: 6,
                ),
                Icon(Icons.verified, color: Colors.blue.shade600, size: 16),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.fullName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                      ),
                ),
                // user.userRole != UserRole.attendee
                //     ? Container(
                //         decoration: BoxDecoration(
                //           color: (user.userRole == UserRole.volunteer
                //                   ? Colors.blue.shade800
                //                   : user.userRole == UserRole.organizer
                //                       ? organizerColorScheme.primary
                //                       : user.userRole == UserRole.speaker
                //                           ? const Color(0xFF34A853)
                //                           : Colors.amber.shade700)
                //               .withOpacity(0.2),
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 4, horizontal: 8),
                //         margin: const EdgeInsets.symmetric(horizontal: 8),
                //         child: Text(
                //           capitalize(user.userRole.name),
                //           style: Theme.of(context)
                //               .textTheme
                //               .labelSmall
                //               ?.copyWith(
                //                   fontWeight: FontWeight.normal, fontSize: 8),
                //         ),
                //       )
                //     : const SizedBox(),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.search),
            iconSize: 16,
          ),
          const SizedBox(
            width: 6,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.info),
            iconSize: 16,
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView.separated(
              primary: false,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemBuilder: (context, index) {
                return Align(
                  alignment: user.messages[index].poster == user.name
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      if (user.messages[index].message.contains("https:")) {}
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: user.messages[index].poster != user.name
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(8).copyWith(
                          topRight: user.messages[index].poster != user.name
                              ? const Radius.circular(0)
                              : null,
                          topLeft: user.messages[index].poster == user.name
                              ? const Radius.circular(0)
                              : null,
                        ),
                      ),
                      child: Text(
                        user.messages[index].message,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: user.messages[index].poster != user.name
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                              decoration: user.messages[index].message
                                      .contains("https:")
                                  ? TextDecoration.underline
                                  : null,
                              decorationColor: Colors.white,
                            ),
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: user.messages.length,
            ),
          ),
          MessageUserInput(mentions: mentions.toList()),
        ],
      ),
    );
  }
}

class MessageUserInput extends StatefulWidget {
  const MessageUserInput({
    super.key,
    required this.mentions,
  });

  final List<UserData> mentions;

  @override
  State<MessageUserInput> createState() => _MessageUserInputState();
}

class _MessageUserInputState extends State<MessageUserInput> {
  var showMention = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserInput(
          onOpenMentions: () {
            showMention = !showMention;
            setState(() {});
          },
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !showMention
              ? Container(
                  height: 0,
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 16)
                          .copyWith(bottom: 32),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.6),
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return MentionTile(user: widget.mentions.toList()[index]);
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget.mentions.length,
                    shrinkWrap: true,
                    primary: false,
                  ),
                ),
        ),
      ],
    );
  }
}

class MentionTile extends StatelessWidget {
  const MentionTile({
    super.key,
    required this.user,
  });

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            user.image,
            height: 45,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MentionUserTile(user: user),
            Text(
              "@${user.name}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}

class MentionUserTile extends StatelessWidget {
  const MentionUserTile({
    super.key,
    required this.user,
  });

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  color: Colors.blue.shade800.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  capitalize(user.userRole.name),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class UserInput extends StatefulWidget {
  final Function() onOpenMentions;
  const UserInput({
    super.key,
    required this.onOpenMentions,
  });

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    messageController.addListener(() {
      setState(() {});
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16)
          .copyWith(bottom: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(children: [
        TextField(
          controller: messageController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter a message",
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions_outlined),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: widget.onOpenMentions,
              icon: const Icon(FeatherIcons.atSign),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo_outlined),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.location_on_outlined),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.duo_outlined),
              color: Theme.of(context).primaryColor,
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: messageController.text.isEmpty ? null : () {},
              child: const Text("Send"),
            ),
          ],
        ),
      ]),
    );
  }
}
