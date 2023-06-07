import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/utils/constants.dart';

class RegisterSnippet extends StatelessWidget {
  final bool isUserSignedIn;
  const RegisterSnippet({super.key, required this.isUserSignedIn});

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
                onPressed: () {},
                child: Text(
                  isUserSignedIn ? 'Register Now' : "Sign in",
                )),
          ],
        ),
      ),
    );
  }
}
