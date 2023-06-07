import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({
    super.key,
    this.bio,
  });

  final String? bio;

  @override
  Widget build(BuildContext context) {
    return bio != null
        ? Text(
            bio!,
            textAlign: TextAlign.center,
          )
        : SizedBox();
  }
}
