import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';
import 'package:nowingoogle/pages/faq_page.dart';
import 'package:nowingoogle/pages/profile_page.dart';
import 'package:nowingoogle/viewmodels/HomeViewModel.dart';
import 'package:nowingoogle/widgets/countdowntimer.dart';
import 'package:nowingoogle/widgets/miniwidgets.dart';
import 'package:nowingoogle/widgets/registersnippet.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var homeViewModel = HomeViewModel();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          InkWell(
            onTap: () async {
              if (FirebaseAuth.instance.currentUser == null) {
                var authResult = await homeViewModel.signIn();
                if (authResult?.additionalUserInfo?.isNewUser ?? true) {
                  // ignore: use_build_context_synchronously
                  showModalBottomSheet(
                      useRootNavigator: true,
                      isScrollControlled: true,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return ProfileBottomSheet(homeViewModel: homeViewModel);
                      });
                }
                setState(() {});
              } else {
                User? user = FirebaseAuth.instance.currentUser;
                var doc = await FirebaseFirestore.instance
                    .collection("user")
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .get();
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          uiState: UserProfileUiState(
                            userRole: UserRole.Attendee,
                            name: user?.displayName ?? "User",
                            image: user?.photoURL ??
                                "https://github.com/ManasMalla.png",
                            profession: doc.get("career"),
                            gender: doc.get("gender"),
                            handle: doc.data()?["handle"],
                            email: user?.email ?? "",
                            phoneNumber: doc.data()?["phoneNumber"],
                            organization: doc.get("organization"),
                            place:
                                "${doc.get("address")["city"]}, ${doc.get("address")["state"]}",
                            bio: doc.data()?["bio"],
                          ),
                        ),
                      ),
                    )
                    .then((value) => setState(() {}));
              }
            },
            child: FirebaseAuth.instance.currentUser == null
                ? const Icon(Icons.account_circle_outlined)
                : const ProfileImage(
                    url: "https://github.com/ManasMalla.png",
                  ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterSnippet(
              isUserSignedIn: FirebaseAuth.instance.currentUser != null,
            ),
            Image.asset(
              'assets/cycle.png',
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Transform.translate(
                  offset: const Offset(0, -1),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 111.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFF202023)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(12.0)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48)
                          .copyWith(top: 24 + 120),
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: const Center(
                      child: Text("54+ attendees and still counting...")),
                ),
                const CountdownTimer(
                  primaryColor: Color(0xFFFBC004),
                  onPrimaryColor: Color(0xFF202023),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          StatefulBuilder(builder: (context, _) {
            return BottomSheet(
                onClosing: () {},
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Help us know you better so that we can provide you with tailored experiences and opportunities. You can always update them from your profile.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Autocomplete(
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return [
                              "Student",
                              "Intern",
                              "Professional",
                            ].where((element) => element
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()));
                          },
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted) {
                            return TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onFieldSubmitted: (String value) {
                                onFieldSubmitted();
                              },
                              onChanged: (_) {
                                homeViewModel.careerController =
                                    textEditingController;
                              },
                              validator: (String? value) {
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Career',
                                filled: true,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Autocomplete(
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return [
                              "Gandhi Institute of Technology And Management (GITAM)",
                              "Gayatri Vidya Parishad (GVP)",
                              "Gayatri Vidya Parishad College for Engineering Women(GVPCEW)",
                              "Ekfrazo Technologies",
                              "Andhra University (AU)"
                            ].where((element) => element
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()));
                          },
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted) {
                            return TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onFieldSubmitted: (String value) {
                                onFieldSubmitted();
                              },
                              onChanged: (_) {
                                homeViewModel.organizationController =
                                    textEditingController;
                              },
                              validator: (String? value) {
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Organization',
                                filled: true,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ListenableBuilder(
                            listenable: homeViewModel,
                            builder: (context, _) {
                              return TextField(
                                controller: homeViewModel.pincodeController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 6,
                                decoration: InputDecoration(
                                  filled: true,
                                  label: const Text("Pincode"),
                                  errorText: homeViewModel.pincodeErrorText,
                                ),
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () {
                                  homeViewModel.createProfile(
                                      FirebaseFirestore.instance,
                                      FirebaseAuth.instance, () {
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: const Text("Save"),
                              )),
                        )
                      ],
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(48).copyWith(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/io-logo.svg",
                height: 36,
              ),
              Text(
                "Extended",
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 24,
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          label: Text("Home"),
          selectedIcon: Icon(Icons.home_rounded),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.question_answer_outlined),
          label: Text("FAQ"),
          selectedIcon: Icon(Icons.question_answer_rounded),
        ),
        Spacer(),
        GDGFooter(),
      ],
      onDestinationSelected: (selection) {
        if (selection == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const FAQPage()));
        }
      },
    );
  }
}

class GDGFooter extends StatelessWidget {
  const GDGFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? Color(0xFF161616)
          : Color(0xFFF0F0F0),
      width: double.infinity,
      padding: EdgeInsets.all(32.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Google Developer Groups Vizag",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xFF5F6368),
              ),
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          children: [
            Text(
              "I/O Extended '23",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Color(0x805F6368)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('faq');
                },
                child: Text(
                  "FAQ",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Color(0x805F6368)),
                )),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed('code-of-conduct');
            //     },
            //     child: Text(
            //       "Code of Conduct",
            //       style: Theme.of(context)
            //           .textTheme
            //           .labelLarge
            //           ?.copyWith(color: Color(0x805F6368)),
            //     )),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  launchUrlString("https://twitter.com/WTMVizag");
                },
                child: SvgPicture.asset("assets/twitter.svg")),
            SizedBox(
              width: 16,
            ),
            InkWell(
                onTap: () {
                  launchUrlString("https://youtube.com/@WTMVizag");
                },
                child: SvgPicture.asset("assets/youtube.svg")),
            SizedBox(
              width: 16,
            ),
            InkWell(
                onTap: () {
                  launchUrlString("http://instagram.com/wtm_vizag");
                },
                child: SvgPicture.asset("assets/instagram.svg"))
          ],
        )
      ]),
    );
  }
}
