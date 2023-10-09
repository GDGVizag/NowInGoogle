import 'package:dartz/dartz.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_user_states.dart';
import 'package:nowingoogle/domain/entities/agenda_item.dart';

final List<AgendaItem> devfest2022Agenda = [
  AgendaItem(
    title: "Welcome to GITAM",
    type: AgendaItemType.other,
    time: DateTime(2023, 12, 2, 9).microsecondsSinceEpoch,
    speaker: Left([
      gurumoorthy.toEntity(),
    ]),
  ),
  AgendaItem(
    title: "Leveraging Communities",
    type: AgendaItemType.keynote,
    time: DateTime(2023, 12, 2, 9, 10).microsecondsSinceEpoch,
    speaker: Left([
      ushaMaam.toEntity(),
    ]),
  ),
  AgendaItem(
    title: "Machine Learning Demystified",
    type: AgendaItemType.talk,
    time: DateTime(2023, 12, 2, 9, 30).microsecondsSinceEpoch,
    speaker: Left([
      krishna.toEntity(),
    ]),
  ),
  AgendaItem(
    title: "Slido Session",
    type: AgendaItemType.icebreaker,
    time: DateTime(2023, 12, 2, 10).microsecondsSinceEpoch,
    speaker: Right([
      umaPrathima.toEntity(),
      volunteerState.toEntity(),
    ]),
    resources: [
      const EventResource(title: "Slido link", link: "https://slido.com"),
    ],
  ),
  AgendaItem(
    title: "the all new, Android Studio: Bot",
    type: AgendaItemType.workshop,
    time: DateTime(2023, 12, 2, 11).microsecondsSinceEpoch,
    speaker: Left([
      speakerState.toEntity(),
    ]),
    requirements: [
      "Android Studio",
      "Compose experience",
    ],
    resources: [
      const EventResource(
          title: "Documentation",
          link: "https://developer.android.com/studio/preview/studio-bot"),
    ],
  ),
];
