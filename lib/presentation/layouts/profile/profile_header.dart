import 'package:flutter/material.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_banner.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.image,
    required this.avatar,
    required this.primaryColor,
    required this.onPrimaryColor,
  });

  final String image;
  final String avatar;
  final Color primaryColor;
  final Color onPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileBanner(primaryColor: primaryColor),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.chevron_left_rounded),
                color: onPrimaryColor,
              ),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              width: double.infinity,
              height: 40,
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: IconButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       icon: const Icon(Icons.chevron_left_rounded),
            //       color: onPrimaryColor,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 64,
            ),
            ProfileImage(
              image: image,
              avatar: avatar,
            ),
          ],
        ),
      ],
    );
  }
}
