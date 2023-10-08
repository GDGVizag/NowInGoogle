import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nowingoogle/domain/entities/agenda_item.dart';
import 'package:nowingoogle/domain/entities/event.dart';
import 'package:nowingoogle/domain/entities/event_perk.dart';
import 'package:nowingoogle/domain/enums/event_type.dart';

class EventModel extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String poster; // who is conducting the event
  final String status; // Offline/ Online Event
  final List<AgendaItem> agenda;
  final String certificate;
  final int date;
  final int? endDate; //Ending time of the event if available
  final String? venue; //used to add display venue if hybrid/offline event
  final double? latitude; //used to add [Navigate to Venue]
  final double? longitude; //used to add [Navigate to Venue]
  final List<EventPerk> perks;
  final bool registrationsOpen;
  final String?
      message; //to display any quick message to users. eg: [Registrations Extended Till 00-00-0000!]
  final Color primaryColor;
  final Color secondaryColor;

  const EventModel({
    required this.id,
    required this.name,
    required this.cover,
    required this.poster,
    required this.status,
    this.agenda = const [],
    required this.certificate,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.perks,
    required this.registrationsOpen,
    this.message,
    this.endDate,
    this.venue,
    this.primaryColor = const Color(0xFF005AC1),
    this.secondaryColor = const Color(0xFF073042),
  });

  @override
  List<Object?> get props => [id];

  Event toEntity() => Event(
        id: id,
        name: name,
        cover: cover,
        poster: poster,
        status: status.toLowerCase() == "hybrid"
            ? EventType.hybrid
            : status.toLowerCase() == "offline"
                ? EventType.offline
                : EventType.online,
        certificate: certificate,
        date: date,
        location: latitude == null || longitude == null
            ? null
            : LatLng(latitude!, longitude!),
        perks: perks,
        registrationsOpen: registrationsOpen,
        message: message,
        endDate: endDate,
        venue: venue,
        agenda: agenda,
      );
}
