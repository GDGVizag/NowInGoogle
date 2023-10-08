import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nowingoogle/domain/entities/event.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  event.cover,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0)
                    ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    event.poster,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        DateFormat("dd MMMM yyyy").format(
                            DateTime.fromMicrosecondsSinceEpoch(event.date)),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade800),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Icon(
                        Icons.access_time_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "10 AM - 11 AM",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.event_seat_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Hybrid",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade800),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.location_on_rounded,
                        size: 16,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "GITAM (Deemed to be University)",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    event.message ?? '',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Agenda",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AgendaListTile(),
                  const SizedBox(
                    height: 12,
                  ),
                  const AgendaListTile(),
                  const SizedBox(
                    height: 12,
                  ),
                  const AgendaListTile(),
                  const SizedBox(
                    height: 12,
                  ),
                  const AgendaListTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgendaListTile extends StatelessWidget {
  const AgendaListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('10:00'),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keynote: Leveraging communities",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Usha Ramani Vemuru",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        )
      ],
    );
  }
}
