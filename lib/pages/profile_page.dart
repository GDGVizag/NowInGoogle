import 'package:flutter/material.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';
import 'package:nowingoogle/utils/capitalize.dart';
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
  var isEditing = false;
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: widget.uiState.name);
    var handleController = TextEditingController(text: widget.uiState.handle);
    var bioController = TextEditingController(text: widget.uiState.bio);
    var phoneController = TextEditingController(text: widget.uiState.phone);
    var emailController = TextEditingController(text: widget.uiState.email);
    var organizationController =
        TextEditingController(text: widget.uiState.organization);
    var placeController = TextEditingController(text: widget.uiState.place);
    return Scaffold(
      floatingActionButton: !isEditing
          ? FloatingActionButton.extended(
              backgroundColor: widget.uiState.primaryContainerColor,
              foregroundColor: widget.uiState.onPrimaryContainerColor,
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
              label: const Text("Edit Profile"),
              icon: const Icon(Icons.edit_outlined),
            )
          : null,
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
                  !isEditing
                      ? Padding(
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
                                    ? (widget.uiState
                                            as VolunteerProfileUiState)
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
                                onPressed: () {},
                                primaryColor: widget.uiState.primaryColor,
                                onPrimaryColor: widget.uiState.onPrimaryColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24.0),
                                child: ProfileFooter(
                                  primaryColor: widget.uiState.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Theme(
                            data: ThemeData.from(
                                colorScheme: Theme.of(context)
                                    .colorScheme
                                    .copyWith(
                                        primary: widget
                                            .uiState.onPrimaryContainerColor,
                                        surface: widget
                                            .uiState.primaryContainerColor,
                                        secondaryContainer:
                                            widget.uiState.primaryColor,
                                        onSecondaryContainer:
                                            widget.uiState.onPrimaryColor),
                                textTheme: Theme.of(context).textTheme,
                                useMaterial3: true),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        widget.uiState.primaryContainerColor,
                                    label: const Text("Name"),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 18,
                                    ),
                                    prefixIconColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => states.contains(
                                                    MaterialState.focused)
                                                ? widget.uiState
                                                    .onPrimaryContainerColor
                                                : kDefaultIconDarkColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: handleController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: widget
                                              .uiState.primaryContainerColor,
                                          label: const Text("Handle"),
                                          prefixIcon: const Icon(
                                            Icons.alternate_email,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: DropdownMenu(
                                        width: 164,
                                        dropdownMenuEntries: const [
                                          DropdownMenuEntry(
                                              value: "student",
                                              label: "Student"),
                                          DropdownMenuEntry(
                                              value: "intern", label: "Intern"),
                                          DropdownMenuEntry(
                                              value: "professional",
                                              label: "Professional"),
                                          DropdownMenuEntry(
                                              value: "gdg", label: "GDG/WTM")
                                        ],
                                        initialSelection:
                                            widget.uiState.profession,
                                        leadingIcon: Icon(
                                          Icons.work,
                                          size: 18,
                                        ),
                                        label: Text("Career"),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: SegmentedButton(
                                    segments: const [
                                      ButtonSegment(
                                        value: "Male",
                                        label: Text("Male"),
                                      ),
                                      ButtonSegment(
                                        value: "Female",
                                        label: Text("Female"),
                                      ),
                                      ButtonSegment(
                                        value: "Other",
                                        label: Text("Other"),
                                      )
                                    ],
                                    selected: {
                                      capitalize(widget.uiState.gender)
                                    },
                                    onSelectionChanged: (_) {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextField(
                                  controller: bioController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Bio")),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextField(
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Phone Number"),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Email"),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextField(
                                  controller: organizationController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Organization"),
                                    prefixIcon: Icon(
                                      Icons.business_outlined,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextField(
                                  controller: placeController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Place"),
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                PrimaryButton(
                                  label: "Save",
                                  onPressed: () {
                                    setState(() {
                                      isEditing = false;
                                    });
                                  },
                                  suffix: const Icon(Icons.save),
                                  primaryColor: widget.uiState.primaryColor,
                                  onPrimaryColor: widget.uiState.onPrimaryColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: ProfileFooter(
                                    primaryColor: widget.uiState.primaryColor,
                                  ),
                                ),
                              ],
                            ),
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
