import 'package:flutter/material.dart';

class UserProfileUiState {
  final String name;
  final String image;
  final String profession;
  final String? handle;
  final String gender;
  final String? bio;

  final String email;
  final String phone;
  final String organization;
  final String place;

  final String userRole;
  final Color primaryColor;
  final Color onPrimaryColor;
  final Color primaryContainerColor;
  final Color onPrimaryContainerColor;
  const UserProfileUiState(
      this.name,
      this.image,
      this.profession,
      this.handle,
      this.gender,
      this.userRole,
      this.bio,
      this.email,
      this.phone,
      this.organization,
      this.place,
      this.primaryColor,
      this.onPrimaryColor,
      this.primaryContainerColor,
      this.onPrimaryContainerColor);
}

class AttendeeProfileUiState extends UserProfileUiState {
  const AttendeeProfileUiState(
      {required String name,
      required String image,
      required String profession,
      String? handle,
      required String gender,
      String? bio,
      required String email,
      required String phoneNumber,
      required String organization,
      required String place})
      : super(
            name,
            image,
            profession,
            handle,
            gender,
            "Attendee",
            bio,
            email,
            phoneNumber,
            organization,
            place,
            const Color(0xFFFBC004),
            const Color(0xFF202023),
            const Color(0xFFFFF5D3),
            const Color(0xFFC39500));
}

class VolunteerProfileUiState extends UserProfileUiState {
  final bool isPOC;
  const VolunteerProfileUiState(
      {required String name,
      required String image,
      required String profession,
      String? handle,
      required String gender,
      String? bio,
      required this.isPOC,
      required String email,
      required String phoneNumber,
      required String organization,
      required String place})
      : super(
            name,
            image,
            profession,
            handle,
            gender,
            "Volunteer",
            bio,
            email,
            phoneNumber,
            organization,
            place,
            const Color(0xFF4285F4),
            Colors.white,
            const Color(0xFFD3E4FF),
            const Color(0xFF4285F4));
}

class OrganizerProfileUiState extends UserProfileUiState {
  const OrganizerProfileUiState(
      {required String name,
      required String image,
      required String profession,
      String? handle,
      required String gender,
      String? bio,
      required String email,
      required String phoneNumber,
      required String organization,
      required String place})
      : super(
            name,
            image,
            profession,
            handle,
            gender,
            "Organizer",
            bio,
            email,
            phoneNumber,
            organization,
            place,
            const Color(0xFFea4335),
            Colors.white,
            const Color(0xFFFFE3E0),
            const Color(0xFFea4335));
}

class SpeakerProfileUiState extends UserProfileUiState {
  final String talkTitle;
  final int talkTime;
  const SpeakerProfileUiState(
      {required String name,
      required String image,
      required String profession,
      String? handle,
      required String gender,
      String? bio,
      required this.talkTitle,
      required this.talkTime,
      required String email,
      required String phoneNumber,
      required String organization,
      required String place})
      : super(
            name,
            image,
            profession,
            handle,
            gender,
            "Speaker",
            bio,
            email,
            phoneNumber,
            organization,
            place,
            const Color(0xFF34A853),
            Colors.white,
            const Color(0xFFD2FFDE),
            const Color(0xFF34A853));
}
