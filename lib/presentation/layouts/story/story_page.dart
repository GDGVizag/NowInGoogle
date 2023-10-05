import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_avatar_image.dart';
import 'package:nowingoogle/presentation/pages/temp/user_data.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as UserData;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://storage.googleapis.com/gweb-uniblog-publish-prod/original_images/210518_1004_3S1A4903_B_1_1.jpeg",
                    fit: BoxFit.cover,
                    alignment: const Alignment(-0.1, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 108,
              ),
            ],
          ),
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 32,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [0, 1, 2, 3]
                      .map(
                        (e) => Container(
                          height: 2,
                          width: (MediaQuery.of(context).size.width / 4) - 16,
                          color: e <= 1
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(children: [
                  ProfileAvatarImage(url: user.image),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(Icons.verified,
                              size: 12, color: Colors.blue.shade300),
                        ],
                      ),
                      Text(
                        capitalize(user.userRole.name),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0)
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Send message",
                          hintStyle:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.6))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.heart),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.send),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
