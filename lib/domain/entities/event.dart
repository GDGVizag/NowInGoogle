import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String poster;
  final String status; // Offline/ Online Event
  final String certificate;
  final int date;
  final LatLng?
      location; //used to add [Navigate to Venue] //used to add [Navigate to Venue]
  final List<String> perks;
  final bool registrationsOpen;
  final String?
      message; //to display any quick message to users. eg: [Registrations Extended Till 00-00-0000!]

  const Event(
      {required this.id,
      required this.name,
      required this.cover,
      required this.poster,
      required this.status,
      required this.certificate,
      required this.date,
      required this.location,
      required this.perks,
      required this.registrationsOpen,
      this.message});

  @override
  List<Object?> get props => [id];
}
