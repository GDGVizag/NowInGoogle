import 'package:flutter/material.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';
import 'package:nowingoogle/utils/get_avatar.dart';
import 'package:nowingoogle/widgets/io_footer.dart';
import 'package:nowingoogle/widgets/listview.dart';
import 'package:nowingoogle/widgets/primary_button.dart';
import 'package:nowingoogle/widgets/profile/profile_header.dart';
import 'package:nowingoogle/widgets/profile/profile_section.dart';
import 'package:nowingoogle/widgets/secondary_button.dart';

class ProfileScreen extends StatefulWidget {
  final UserProfileUiState uiState;
  const ProfileScreen({super.key, required this.uiState});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: widget.uiState.primaryContainerColor,
        foregroundColor: widget.uiState.onPrimaryContainerColor,
        onPressed: () {},
        label: const Text("Edit Profile"),
        icon: const Icon(Icons.edit_outlined),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ProfileHeader(
                    image: widget.uiState.image,
                    avatar: getAvatarUrl(widget.uiState.userRole),
                    primaryColor: widget.uiState.primaryColor,
                    onPrimaryColor: widget.uiState.onPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        ProfileSection(
                          name: widget.uiState.name,
                          profession: widget.uiState.profession,
                          handle: widget.uiState.handle,
                          gender: widget.uiState.gender,
                          userRole: widget.uiState.userRole,
                          isPOC: widget.uiState is VolunteerProfileUiState
                              ? (widget.uiState as VolunteerProfileUiState)
                                  .isPOC
                              : false,
                          bio: widget.uiState.bio,
                          primaryColor: widget.uiState.primaryColor,
                          onPrimaryColor: widget.uiState.onPrimaryColor,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        if (widget.uiState.userRole == "Speaker")
                          CustomListView(list: {
                            "talk_name":
                                (widget.uiState as SpeakerProfileUiState)
                                    .talkTitle,
                            "talk_duration":
                                "${(widget.uiState as SpeakerProfileUiState).talkTime} minutes",
                          }),
                        CustomListView(
                          list: {
                            "email": widget.uiState.email,
                            "phone_number":
                                "+91 ${widget.uiState.phone.toString().substring(0, 5)} ${widget.uiState.phone.toString().substring(5, 10)}",
                            "organization": widget.uiState.organization,
                            "place": widget.uiState.place,
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SecondaryButton(
                          label: "Delete my data",
                          primaryColor: widget.uiState.primaryColor,
                          onPrimaryColor: widget.uiState.onPrimaryColor,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PrimaryButton(
                          label: "Log out",
                          primaryColor: widget.uiState.primaryColor,
                          onPrimaryColor: widget.uiState.onPrimaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: ProfileFooter(
                            primaryColor: widget.uiState.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
