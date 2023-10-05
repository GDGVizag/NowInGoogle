import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';
import 'package:nowingoogle/data/utils/get_avatar.dart';
import 'package:nowingoogle/domain/entities/speaker.dart';
import 'package:nowingoogle/domain/entities/user.dart';
import 'package:nowingoogle/domain/entities/volunteer.dart';
import 'package:nowingoogle/domain/enums/user_roles.dart';
import 'package:nowingoogle/presentation/pages/widgets/io_footer.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_header.dart';
import 'package:nowingoogle/presentation/layouts/profile/profile_section.dart';
import 'package:nowingoogle/presentation/layouts/title_subtitle_listview.dart';
import 'package:nowingoogle/presentation/layouts/primary_button.dart';
import 'package:nowingoogle/presentation/layouts/secondary_button.dart';

class ProfileScreen extends StatefulWidget {
  // final User user;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var isEditing = false;
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    var nameController =
        TextEditingController(text: "${user.firstName} ${user.lastName}");
    var handleController =
        TextEditingController(text: user.handles.values.firstOrNull ?? "");
    var bioController = TextEditingController(text: user.bio);
    var phoneController = TextEditingController(text: user.phone);
    var emailController = TextEditingController(text: user.email);
    var organizationController = TextEditingController(text: user.organization);
    var placeController = TextEditingController(text: user.place);
    return Scaffold(
      floatingActionButton: !isEditing
          ? FloatingActionButton.extended(
              backgroundColor: user.colorScheme.primaryContainer,
              foregroundColor: user.colorScheme.onPrimaryContainer,
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
                    image: user.avatar,
                    avatar: getAvatarUrl(user.userRole),
                    primaryColor: user.colorScheme.primary,
                    onPrimaryColor: user.colorScheme.onPrimary,
                  ),
                  !isEditing
                      ? Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              ProfileSection(
                                name: "${user.firstName} ${user.lastName}",
                                profession: user.career,
                                handle: user.handles.values.join(", "),
                                gender: user.gender,
                                userRole: user.userRole,
                                isPOC: user is Volunteer ? user.isPOC : false,
                                bio: user.bio,
                                primaryColor: user.colorScheme.primary,
                                onPrimaryColor: user.colorScheme.onPrimary,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              if (user.userRole == UserRole.speaker)
                                CustomListView(list: {
                                  "talk_name": (user as Speaker).talkTitle,
                                  "talk_duration": "${user.talkTime} minutes",
                                }),
                              CustomListView(
                                list: user.phone != null
                                    ? {
                                        "email": user.email,
                                        "phone_number":
                                            "+91 ${user.phone.toString().substring(0, 5)} ${user.phone.toString().substring(5, 10)}",
                                        "organization": user.organization,
                                        "place": user.place,
                                      }
                                    : {
                                        "email": user.email,
                                        "organization": user.organization,
                                        "place": user.place,
                                      },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SecondaryButton(
                                    label: "Delete my data",
                                    primaryColor: user.colorScheme.primary,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  PrimaryButton(
                                    label: "Log out",
                                    onPressed: () {
                                      //TODO: Logout
                                    },
                                    primaryColor: user.colorScheme.primary,
                                    onPrimaryColor: user.colorScheme.onPrimary,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24.0),
                                child: ProfileFooter(
                                  primaryColor: user.colorScheme.primary,
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
                                        primary:
                                            user.colorScheme.onPrimaryContainer,
                                        surface:
                                            user.colorScheme.primaryContainer,
                                        secondaryContainer:
                                            user.colorScheme.primary,
                                        onSecondaryContainer:
                                            user.colorScheme.onPrimary),
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
                                        user.colorScheme.primaryContainer,
                                    label: const Text("Name"),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 18,
                                    ),
                                    prefixIconColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => states.contains(
                                                    MaterialState.focused)
                                                ? user.colorScheme
                                                    .onPrimaryContainer
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
                                          fillColor:
                                              user.colorScheme.primaryContainer,
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
                                        initialSelection:
                                            user.career.toLowerCase(),
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
                                    selected: {capitalize(user.gender)},
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
                                  primaryColor: user.colorScheme.primary,
                                  onPrimaryColor: user.colorScheme.onPrimary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: ProfileFooter(
                                    primaryColor: user.colorScheme.primary,
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
