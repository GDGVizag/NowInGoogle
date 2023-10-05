import 'package:flutter/material.dart';
import 'package:nowingoogle/domain/entities/event.dart';
import 'package:nowingoogle/presentation/layouts/announcement_banner.dart';
import 'package:nowingoogle/presentation/pages/widgets/countdown_timer.dart';

class EventAnnouncementBanner extends StatelessWidget {
  final Event event;
  final bool isEventNamePlural;
  const EventAnnouncementBanner({
    super.key,
    required this.event,
    this.isEventNamePlural = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnouncementBanner(children: [
      Text(
        // "DevFest is around the corner. Register now!",
        "${event.name} ${isEventNamePlural ? "are" : "is"} around the corner. Register now!",
        textAlign: TextAlign.center,
      ),
      CountdownTimer(
          eventDate: event.date,
          primaryColor: Theme.of(context).colorScheme.primary,
          onPrimaryColor: Theme.of(context).colorScheme.primary),
    ]);
  }
}
