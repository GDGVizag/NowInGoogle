import 'package:flutter/material.dart';
import 'package:nowingoogle/widgets/profile/profile_bio.dart';
import 'package:nowingoogle/widgets/profile/profile_subtitle.dart';
import 'package:nowingoogle/widgets/profile/profile_title.dart';
import 'package:nowingoogle/widgets/profile/profile_user_role.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection(
      {super.key,
      required this.name,
      required this.profession,
      this.handle,
      required this.gender,
      required this.userRole,
      this.isPOC = false,
      this.bio,
      required this.primaryColor,
      required this.onPrimaryColor});

  final String name;
  final String profession;
  final String? handle;
  final String gender;
  final String userRole;
  final Color primaryColor;
  final Color onPrimaryColor;
  final bool isPOC;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTitle(name: name, isAttendee: userRole == "Attendee"),
        ProfileSubtitle(
          profession: profession,
          handle: handle,
          gender: gender,
        ),
        ProfileUserRole(
            userRole: userRole,
            isPOC: isPOC,
            primaryColor: primaryColor,
            onPrimaryColor: onPrimaryColor),
        const SizedBox(
          height: 12,
        ),
        ProfileBio(bio: bio),
      ],
    );
  }
}
