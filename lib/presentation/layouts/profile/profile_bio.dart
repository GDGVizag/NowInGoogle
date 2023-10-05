import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({
    super.key,
    required this.bio,
  });

  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Text(
      bio ??
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dolor nunc, gravida vitae vehicula tempor, eleifend eget mauris. Sed sit amet erat consequat, viverra justo vitae, suscipit est. In vestibulum ex eget nunc convallis auctor. Suspendisse imperdiet vitae nisl eu tempus. Integer tristique dolor egestas metus tincidunt.",
      textAlign: TextAlign.center,
    );
  }
}
