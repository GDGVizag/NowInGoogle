import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileFooter extends StatelessWidget {
  final Color primaryColor;
  const ProfileFooter({super.key, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.2,
          child: SvgPicture.asset(
            "assets/io-logo.svg",
            height: 32,
            color: primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 16),
          child: Text(
            "© 2023. Manas Malla. All Rights Reserved",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
