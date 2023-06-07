import 'package:flutter/material.dart';
import 'package:nowingoogle/models/user_profile_ui_state.dart';

class ProfileUserRole extends StatelessWidget {
  const ProfileUserRole({
    super.key,
    required this.userRole,
    this.isPOC = false,
    required this.primaryColor,
    required this.onPrimaryColor,
  });

  final UserRole userRole;
  final bool isPOC;
  final Color primaryColor;
  final Color onPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userRole.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: onPrimaryColor),
                ),
                if (isPOC && userRole != UserRole.Attendee)
                  const SizedBox(width: 16),
                if (isPOC && userRole != UserRole.Attendee)
                  Text(
                    "POC",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: onPrimaryColor.withOpacity(0.5)),
                  ),
              ],
            )),
        if (userRole.name == "Speaker")
          const SizedBox(
            width: 12,
          ),
        if (userRole.name == "Speaker")
          Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                "Android",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: primaryColor),
              )),
      ],
    );
  }
}
