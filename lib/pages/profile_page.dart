import 'package:firebase_auth/firebase_auth.dart';
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

class ProfilePage extends StatefulWidget {
  final UserProfileUiState uiState;
  const ProfilePage({super.key, required this.uiState});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var isEditing = false;
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: widget.uiState.name);
    var handleController = TextEditingController(text: widget.uiState.handle);
    var bioController = TextEditingController(text: widget.uiState.bio);
    var phoneController =
        TextEditingController(text: widget.uiState.phoneNumber);
    var emailController = TextEditingController(text: widget.uiState.email);
    var organizationController =
        TextEditingController(text: widget.uiState.organization);
    var placeController = TextEditingController(text: widget.uiState.place);
    return Scaffold(
      floatingActionButton: !isEditing
          ? FloatingActionButton.extended(
              backgroundColor:
                  widget.uiState.getColorScheme().primaryContainerColor,
              foregroundColor:
                  widget.uiState.getColorScheme().onPrimaryContainerColor,
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
                    primaryColor: widget.uiState.getColorScheme().primaryColor,
                    onPrimaryColor:
                        widget.uiState.getColorScheme().onPrimaryColor,
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
                                isPOC: widget.uiState.isPOC ?? false,
                                bio: widget.uiState.bio,
                                primaryColor: widget.uiState
                                    .getColorScheme()
                                    .primaryColor,
                                onPrimaryColor: widget.uiState
                                    .getColorScheme()
                                    .onPrimaryColor,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              if (widget.uiState.userRole == UserRole.Speaker)
                                CustomListView(list: {
                                  "talk_name": widget.uiState.talkTitle,
                                  "talk_duration":
                                      "${widget.uiState.talkTime} minutes",
                                }),
                              CustomListView(
                                list: widget.uiState.phoneNumber != null
                                    ? {
                                        "email": widget.uiState.email,
                                        "phone_number":
                                            "+91 ${widget.uiState.phoneNumber.toString().substring(0, 5)} ${widget.uiState.phoneNumber.toString().substring(5, 10)}",
                                        "organization":
                                            widget.uiState.organization,
                                        "place": widget.uiState.place,
                                      }
                                    : {
                                        "email": widget.uiState.email,
                                        "organization":
                                            widget.uiState.organization,
                                        "place": widget.uiState.place,
                                      },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SecondaryButton(
                                label: "Delete my data",
                                primaryColor: widget.uiState
                                    .getColorScheme()
                                    .primaryColor,
                                onPrimaryColor: widget.uiState
                                    .getColorScheme()
                                    .onPrimaryColor,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              PrimaryButton(
                                label: "Log out",
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pop();
                                },
                                primaryColor: widget.uiState
                                    .getColorScheme()
                                    .primaryColor,
                                onPrimaryColor: widget.uiState
                                    .getColorScheme()
                                    .onPrimaryColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24.0),
                                child: ProfileFooter(
                                  primaryColor: widget.uiState
                                      .getColorScheme()
                                      .primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Theme(
                            data: ThemeData.from(
                                colorScheme:
                                    Theme.of(context)
                                        .colorScheme
                                        .copyWith(
                                            primary: widget.uiState
                                                .getColorScheme()
                                                .onPrimaryContainerColor,
                                            surface: widget.uiState
                                                .getColorScheme()
                                                .primaryContainerColor,
                                            secondaryContainer: widget.uiState
                                                .getColorScheme()
                                                .primaryColor,
                                            onSecondaryContainer: widget.uiState
                                                .getColorScheme()
                                                .onPrimaryColor),
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
                                    fillColor: widget.uiState
                                        .getColorScheme()
                                        .primaryContainerColor,
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
                                                    .getColorScheme()
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
                                          fillColor: widget.uiState
                                              .getColorScheme()
                                              .primaryContainerColor,
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
                                        ],
                                        initialSelection: widget
                                            .uiState.profession
                                            .toLowerCase(),
                                        leadingIcon: const Icon(
                                          Icons.work,
                                          size: 18,
                                        ),
                                        label: const Text("Career"),
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
                                  primaryColor: widget.uiState
                                      .getColorScheme()
                                      .primaryColor,
                                  onPrimaryColor: widget.uiState
                                      .getColorScheme()
                                      .onPrimaryColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: ProfileFooter(
                                    primaryColor: widget.uiState
                                        .getColorScheme()
                                        .primaryColor,
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
