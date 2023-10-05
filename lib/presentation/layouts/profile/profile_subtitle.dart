import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';

class ProfileSubtitle extends StatelessWidget {
  final String profession;
  final String? handle;
  final String gender;
  const ProfileSubtitle(
      {super.key, required this.profession, this.handle, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          handle != null
              ? "${capitalize(profession)} • @$handle "
              : "${capitalize(profession)} ",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            gender == "male" ? "• he/him" : "• she/her",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
