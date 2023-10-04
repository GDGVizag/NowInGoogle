import 'package:flutter/material.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: primaryColor,
    );
  }
}
