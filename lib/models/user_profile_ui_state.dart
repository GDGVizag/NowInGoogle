import 'package:flutter/material.dart';

enum UserRole { Attendee, Volunteer, Speaker, Organizer }

class ColorScheme {
  final Color primaryColor;
  final Color onPrimaryColor;
  final Color primaryContainerColor;
  final Color onPrimaryContainerColor;
  const ColorScheme(this.primaryColor, this.onPrimaryColor,
      this.primaryContainerColor, this.onPrimaryContainerColor);
}

var attendeeColorScheme = const ColorScheme(
    Color(0xFFFBC004), Color(0xFF202023), Color(0xFFFFF5D3), Color(0xFFC39500));
var volunteerColorScheme = const ColorScheme(
    Color(0xFF4285F4), Colors.white, Color(0xFFD3E4FF), Color(0xFF4285F4));
var organizerColorScheme = const ColorScheme(
    Color(0xFFea4335), Colors.white, Color(0xFFFFE3E0), Color(0xFFea4335));
var speakerColorScheme = const ColorScheme(
    Color(0xFF34A853), Colors.white, Color(0xFFD2FFDE), Color(0xFF34A853));

class UserProfileUiState {
  final String name;
  final String image;
  final String profession;
  final String? handle;
  final String gender;
  final String? bio;

  final String email;
  final String? phoneNumber;
  final String organization;
  final String place;

  final UserRole userRole;

  final bool? isPOC;
  final String? talkTitle;
  final int? talkTime;

  const UserProfileUiState({
    required this.userRole,
    required this.name,
    required this.image,
    required this.profession,
    this.handle,
    required this.gender,
    this.bio,
    required this.email,
    this.phoneNumber,
    required this.organization,
    required this.place,
    this.isPOC,
    this.talkTitle,
    this.talkTime,
  });
  ColorScheme getColorScheme() {
    switch (userRole) {
      case UserRole.Volunteer:
        return volunteerColorScheme;
      case UserRole.Speaker:
        return speakerColorScheme;
      case UserRole.Organizer:
        return organizerColorScheme;
      default:
        return attendeeColorScheme;
    }
  }
}
