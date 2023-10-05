import 'package:flutter/material.dart';
import 'package:nowingoogle/data/models/event_model.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';

var events = [
  EventModel(
    id: "devfest-23",
    name: "DevFest 2023",
    cover: "assets/event-cover/devfest.png",
    poster: "Google Developer Groups",
    status: "Online",
    certificate: "",
    date: DateTime(2023, 12, 2, 10).microsecondsSinceEpoch,
    latitude: 17.7816493,
    longitude: 83.3748851,
    perks: const [],
    registrationsOpen: true,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    // secondaryColor: speakerColorScheme.primary,
    // primaryColor: const Color(0xFF34A853),
  ),
  EventModel(
    id: "devfest-android-23",
    name: "android @ DevFest",
    cover: "assets/event-cover/devfest-green.png",
    poster: "Google Developer Groups",
    status: "Online",
    certificate: "",
    date: DateTime(2023, 12, 2, 10).microsecondsSinceEpoch,
    latitude: 17.7816493,
    longitude: 83.3748851,
    perks: const [],
    registrationsOpen: true,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    secondaryColor: speakerColorScheme.primary,
    primaryColor: const Color(0xFF34A853),
  ),
  EventModel(
    id: "ssd-23",
    name: "Startup Success Days",
    cover: "assets/event-cover/startup-success-days.png",
    poster: "Google Developer Groups",
    status: "Offline",
    certificate: "",
    date: DateTime(2023, 10, 15, 10).microsecondsSinceEpoch,
    latitude: 17.7279395,
    longitude: 83.3135942,
    perks: const [],
    registrationsOpen: true,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    primaryColor: Colors.black,
    secondaryColor: Colors.black,
  ),
  EventModel(
    id: "ctr-gitam-23",
    name: "Core Team Recruitments",
    cover: "assets/event-cover/core-team-recruitments.webp",
    poster: "Google Developer Student Clubs",
    status: "Online",
    certificate: "",
    date: DateTime(2023, 12, 2, 10).microsecondsSinceEpoch,
    latitude: 17.7816493,
    longitude: 83.3748851,
    perks: const [],
    registrationsOpen: true,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    secondaryColor: speakerColorScheme.primary,
    primaryColor: const Color(0xFF34A853),
  ),
];
