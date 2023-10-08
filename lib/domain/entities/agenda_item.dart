import 'package:nowingoogle/domain/entities/speaker.dart';

class AgendaItem {
  final String title;
  final String? description;
  final int time;
  final AgendaItemType type;
  final Speaker speaker;
  final String? streamLink;
  final String notes;
  final List<String> requirements;
  final List<EventResource> resources;
  const AgendaItem({
    required this.title,
    required this.type,
    this.description,
    required this.time,
    required this.speaker,
    this.streamLink,
    this.notes = "",
    this.requirements = const [],
    this.resources = const [],
  });
}

class EventResource {
  final String title;
  final String link;
  const EventResource({
    required this.title,
    required this.link,
  });
}

enum AgendaItemType {
  talk,
  icebreaker,
  workshop,
  codelab,
  keynote,
  other,
}
