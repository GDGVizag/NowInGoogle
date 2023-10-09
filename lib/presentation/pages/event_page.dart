import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nowingoogle/data/utils/capitalize.dart';
import 'package:nowingoogle/domain/entities/agenda_item.dart';
import 'package:nowingoogle/domain/entities/event.dart';
import 'package:nowingoogle/domain/entities/event_perk.dart';
import 'package:nowingoogle/domain/enums/event_type.dart';
import 'package:nowingoogle/presentation/layouts/bottom_sheets/rsvp_bottom_sheet.dart';
import 'package:nowingoogle/presentation/pages/utils/profile_screen_arguments.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                      event.registrationsOpen
                          ? const SizedBox(
                              width: 16,
                            )
                          : const SizedBox(),
                      event.registrationsOpen
                          ? FilledButton(
                              onPressed: () {
                                showRSVPBottomSheet(context, event);
                              },
                              child: const Text("RSVP"),
                            )
                          : const SizedBox(),
                    ],
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
                        DateFormat("hh:mm aa").format(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    event.date)) +
                            (event.endDate != null
                                ? " - ${DateFormat("hh:mm aa").format(DateTime.fromMicrosecondsSinceEpoch(event.endDate!))}"
                                : ""),
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
                        capitalize(event.status.name),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade800),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      event.status != EventType.online
                          ? Icon(
                              Icons.location_on_rounded,
                              size: 16,
                              color: Colors.blue.shade700,
                            )
                          : const SizedBox(),
                      event.status != EventType.online
                          ? const SizedBox(
                              width: 6,
                            )
                          : const SizedBox(),

                      ///Geoparse the location, instead take both lat and long and title as universities can't usualy be geo parsed
                      event.status != EventType.online
                          ? Text(
                              event.venue ?? 'TBA',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey.shade800),
                            )
                          : const SizedBox(),
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
                  event.agenda.isEmpty
                      ? const Text(
                          "Agenda will be updated soon! Check-in soon.")
                      : ListView.separated(
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, agendaItemIndex) {
                            return AgendaListTile(
                              agendaItem: event.agenda[agendaItemIndex],
                            );
                          },
                          separatorBuilder: (context, _) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: event.agenda.length,
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Perks",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  event.perks.isEmpty
                      ? const Text(
                          "Perks will be updated soon! Don't forget to check back soon.")
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, perkItemIndex) {
                            return PerkListTile(
                              perk: event.perks[perkItemIndex],
                            );
                          },
                          itemCount: event.perks.length,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerkListTile extends StatelessWidget {
  final EventPerk perk;
  const PerkListTile({
    super.key,
    required this.perk,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              perk.image,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              Text(
                perk.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                perk.description ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AgendaListTile extends StatelessWidget {
  final AgendaItem agendaItem;
  const AgendaListTile({
    super.key,
    required this.agendaItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        agendaItem.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            agendaItem.type.name,
                            style: GoogleFonts.dmMono(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "•",
                            style: GoogleFonts.dmMono(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            DateFormat("hh:mm aa").format(
                              DateTime.fromMicrosecondsSinceEpoch(
                                  agendaItem.time),
                            ),
                            style: GoogleFonts.dmMono(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        agendaItem.description ??
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tristique, tellus tempor rutrum placerat, odio turpis hendrerit purus.",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Speaker",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        itemBuilder: (context, speakerIndex) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                "profile",
                                arguments: agendaItem.speaker.fold(
                                  (speaker) => ProfileScreenArguments(
                                    user: speaker[speakerIndex],
                                    isSelfProfile: false,
                                  ),
                                  (volunteer) => ProfileScreenArguments(
                                    user: volunteer[speakerIndex],
                                    isSelfProfile: false,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    agendaItem.speaker.fold(
                                        (speaker) =>
                                            speaker[speakerIndex].avatar,
                                        (volunteer) =>
                                            volunteer[speakerIndex].avatar),
                                    height: 54,
                                    width: 54,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "${agendaItem.speaker.fold((speaker) => speaker[speakerIndex].firstName, (volunteer) => volunteer[speakerIndex].firstName)} ${agendaItem.speaker.fold(
                                                (speaker) =>
                                                    speaker[speakerIndex]
                                                        .lastName,
                                                (volunteer) =>
                                                    volunteer[speakerIndex]
                                                        .lastName,
                                              )}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            Icons.verified,
                                            color: Colors.blue.shade700,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${agendaItem.speaker.fold((speaker) => speaker[speakerIndex].career, (volunteer) => volunteer[speakerIndex].career)}, ${agendaItem.speaker.fold((speaker) => speaker[speakerIndex].organization, (volunteer) => volunteer[speakerIndex].organization)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "@${agendaItem.speaker.fold((speaker) => speaker[speakerIndex].username, (volunteer) => volunteer[speakerIndex].username)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey.shade700),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, _) => const SizedBox(
                          height: 8,
                        ),
                        itemCount: agendaItem.speaker
                            .fold((l) => l.length, (r) => r.length),
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                      ),
                      agendaItem.notes.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Notes",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Notes",
                                ),
                              ],
                            ),
                      agendaItem.requirements.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Requirements",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ListView.separated(
                                  itemBuilder: (context, requirementIndex) {
                                    return Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_outline,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          agendaItem
                                              .requirements[requirementIndex],
                                          style: GoogleFonts.dmMono(),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, _) =>
                                      const SizedBox(
                                    height: 4,
                                  ),
                                  itemCount: agendaItem.requirements.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: EdgeInsets.zero,
                                )
                              ],
                            ),
                      agendaItem.resources.isEmpty
                          ? const SizedBox()
                          : agendaItem.resources
                                  .where((element) =>
                                      element.title.toLowerCase() ==
                                      "slido link")
                                  .isEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "Resources",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ListView.separated(
                                      itemBuilder: (context, resourceIndex) {
                                        final resource =
                                            agendaItem.resources[resourceIndex];
                                        return InkWell(
                                          onTap: () {
                                            launchUrlString(resource.link);
                                          },
                                          child: Text(
                                            resource.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  color: Colors.blue.shade700,
                                                ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, _) =>
                                          const SizedBox(
                                        height: 4,
                                      ),
                                      itemCount: agendaItem.resources.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: FilledButton(
                                    onPressed: () {
                                      launchUrlString(agendaItem.resources
                                          .where((element) =>
                                              element.title.toLowerCase() ==
                                              "slido link")
                                          .first
                                          .link);
                                    },
                                    child: const Text("Start Activity"),
                                  ),
                                ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Row(
        children: [
          Text(
            DateFormat("HH:mm").format(
              DateTime.fromMicrosecondsSinceEpoch(agendaItem.time),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agendaItem.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ListView.separated(
                  itemBuilder: (context, speakerIndex) {
                    return Text(
                      "${agendaItem.speaker.fold((speaker) => speaker[speakerIndex].firstName, (volunteer) => volunteer[speakerIndex].firstName)} ${agendaItem.speaker.fold(
                        (speaker) => speaker[speakerIndex].lastName,
                        (volunteer) => volunteer[speakerIndex].lastName,
                      )}",
                      style: Theme.of(context).textTheme.labelMedium,
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(
                    height: 4,
                  ),
                  itemCount:
                      agendaItem.speaker.fold((l) => l.length, (r) => r.length),
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
