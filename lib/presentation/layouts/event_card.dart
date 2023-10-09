import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nowingoogle/domain/entities/event.dart';
import 'package:nowingoogle/presentation/layouts/bottom_sheets/rsvp_bottom_sheet.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Color primaryColor;
  final Color secondaryColor;
  const EventCard({
    super.key,
    required this.event,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: primaryColor,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 200,
              child: Image.asset(
                event.cover,
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(event.poster),
                        const SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.verified,
                          size: 12,
                          color: Colors.blue.shade700,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 16,
                          color: secondaryColor,
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
                        Icon(
                          Icons.location_on_rounded,
                          size: 16,
                          color: secondaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          event.location?.latitude.toString() ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      event.message ?? "",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () {
                            showRSVPBottomSheet(context, event);
                          },
                          child: const Text("Register Now"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('event', arguments: event);
                          },
                          child: const Text("Learn More"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
