import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nowingoogle/domain/entities/agenda_item.dart';
import 'package:nowingoogle/domain/entities/event_perk.dart';
import 'package:nowingoogle/domain/enums/event_type.dart';

class Event extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String poster;
  final EventType status; // Offline/ Online Event
  final List<AgendaItem> agenda;
  final String certificate;
  final int date;
  final int? endDate; //Ending time of the event if available
  final String? venue; //used to add display venue if hybrid/offline event
  final LatLng?
      location; //used to add [Navigate to Venue] //used to add [Navigate to Venue]
  final List<EventPerk> perks;
  final bool registrationsOpen;
  final String?
      message; //to display any quick message to users. eg: [Registrations Extended Till 00-00-0000!]

  const Event({
    required this.id,
    required this.name,
    required this.cover,
    required this.poster,
    required this.status,
    required this.agenda,
    required this.certificate,
    required this.date,
    required this.location,
    required this.perks,
    required this.registrationsOpen,
    this.message,
    this.endDate,
    this.venue,
  });

  @override
  List<Object?> get props => [id];
}
