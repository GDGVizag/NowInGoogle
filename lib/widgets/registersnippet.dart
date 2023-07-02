import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/pages/home_page.dart';
import 'package:nowingoogle/utils/constants.dart';
import 'package:nowingoogle/viewmodels/HomeViewModel.dart';

class RegisterSnippet extends StatefulWidget {
  final HomeViewModel homeViewModel;
  final bool isUserSignedIn;
  const RegisterSnippet(
      {super.key, required this.isUserSignedIn, required this.homeViewModel});

  @override
  State<RegisterSnippet> createState() => _RegisterSnippetState();
}

class _RegisterSnippetState extends State<RegisterSnippet> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I/O\nExtended',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'August 5, 2023',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 18,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 36.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.',
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            FilledButton(
                onPressed: () async {
                  if (FirebaseAuth.instance.currentUser == null) {
                    var authResult = await widget.homeViewModel.signIn();
                    if (authResult?.additionalUserInfo?.isNewUser ?? true) {
                      // ignore: use_build_context_synchronously
                      showModalBottomSheet(
                          useRootNavigator: true,
                          isScrollControlled: true,
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return ProfileBottomSheet(_formKey,
                                homeViewModel: widget.homeViewModel);
                          });
                    }
                    setState(() {});
                  } else {
                    //todo show registration screen
                  }
                },
                child: Text(
                  widget.isUserSignedIn ? 'Register Now' : "Sign in",
                )),
          ],
        ),
      ),
    );
  }
}
