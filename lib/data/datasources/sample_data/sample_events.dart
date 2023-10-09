import 'package:flutter/material.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_devfest_agenda.dart';
import 'package:nowingoogle/data/models/event_model.dart';
import 'package:nowingoogle/domain/entities/event_perk.dart';
import 'package:nowingoogle/domain/entities/questionnaire.dart';
import 'package:nowingoogle/presentation/constants/color_scheme.dart';

var events = [
  EventModel(
    id: "devfest-23",
    name: "DevFest 2023",
    cover: "assets/event-cover/devfest.png",
    poster: "Google Developer Groups",
    status: "hybrid",
    venue: " GITAM (Deemed to be University)",
    agenda: devfest2022Agenda,
    certificate: "",
    date: DateTime(2023, 12, 2, 10).microsecondsSinceEpoch,
    latitude: 17.7816493,
    longitude: 83.3748851,
    perks: const [
      EventPerk(
          title: "Attendee Badge",
          description: "Get a cool attendee badge",
          image:
              "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/img_devfest.png"),
      EventPerk(
          title: "Certificates",
          description: "Get a cool attendee badge",
          image:
              "https://www.classcentral.com/report/wp-content/uploads/2021/02/google-certs.png"),
      EventPerk(
          title: "Perk",
          description: "Get a cool attendee badge",
          image:
              "https://www.classcentral.com/report/wp-content/uploads/2021/02/google-certs.png"),
    ],
    registrationsOpen: true,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    questionnaire: const Questionnaire(
      questions: [
        Question<String>(
            type: QuestionType.longAnswer,
            question: "Why do you want to attend DevFest 2022?",
            hint: "I want to attend DevFest because"),
        Question<String>(
          type: QuestionType.mcq,
          question: "Select the Google tech stacks that you're interested in?",
          options: [
            "Android",
            "Flutter",
            "Machine Learning",
            "Cloud",
            "Web",
          ],
        ),
      ],
    ),
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
    endDate: DateTime(2023, 10, 15, 17).microsecondsSinceEpoch,
    venue: "Peter F Drucker Hall, AU(SC)",
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
    registrationsOpen: false,
    message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et mauris dui. Duis viverra quam venenatis dui tincidunt.",
    secondaryColor: speakerColorScheme.primary,
    primaryColor: const Color(0xFF34A853),
  ),
];
