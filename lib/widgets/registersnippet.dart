import 'package:flutter/material.dart';
import 'package:nowingoogle/color_schemes.g.dart';
import 'package:nowingoogle/utils/constants.dart';
import 'package:nowingoogle/widgets/countdowntimer.dart';
import 'package:nowingoogle/widgets/functions.dart';
import 'package:nowingoogle/widgets/miniwidgets.dart';
import 'package:nowingoogle/widgets/textwidgets.dart';

class RegisterSnippet extends StatelessWidget {
  const RegisterSnippet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 352,
      child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingOne(
              child: 'I/O\nExtended',
              size: 54,
            ),
            HeadingOne(child: '8th July 2023'),
            GeneralSpacer(),
            HeadingThree(
              child:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.',
              color: grey.withOpacity(0.6),
            ),
            GeneralSpacer(),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {},
                child: HeadingThree(
                  child: 'Register Now',
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ],
        ),
      ),
    );
  }
}
