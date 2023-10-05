import 'package:flutter/material.dart';

class UserColorScheme {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  const UserColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
  });
}

const attendeeColorScheme = UserColorScheme(
  primary: Color(0xFFFBC004),
  onPrimary: Color(0xFF202023),
  primaryContainer: Color(0xFFFFF5D3),
  onPrimaryContainer: Color(0xFFC39500),
);

const volunteerColorScheme = UserColorScheme(
  primary: Color(0xFF4285F4),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFD3E4FF),
  onPrimaryContainer: Color(0xFF4285F4),
);
const organizerColorScheme = UserColorScheme(
  primary: Color(0xFFea4335),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFFFE3E0),
  onPrimaryContainer: Color(0xFFea4335),
);
const speakerColorScheme = UserColorScheme(
  primary: Color(0xFF34A853),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFD2FFDE),
  onPrimaryContainer: Color(0xFF34A853),
);
