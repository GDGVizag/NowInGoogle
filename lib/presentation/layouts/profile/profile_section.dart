import 'package:flutter/material.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import './profile_bio.dart';
import './profile_subtitle.dart';
import './profile_title.dart';
import './profile_user_role.dart';

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
  final UserRole userRole;
  final Color primaryColor;
  final Color onPrimaryColor;
  final bool isPOC;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTitle(name: name, isAttendee: userRole == UserRole.attendee),
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
