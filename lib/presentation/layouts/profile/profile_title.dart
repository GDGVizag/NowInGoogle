import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    super.key,
    required this.name,
    required this.isAttendee,
  });

  final String name;
  final bool isAttendee;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        if (!isAttendee)
          const SizedBox(
            width: 8,
          ),
        if (!isAttendee)
          const Icon(
            Icons.verified,
            size: 18,
            color: Color(0xFF4285f4),
          ),
      ],
    );
  }
}
