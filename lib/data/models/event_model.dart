import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nowingoogle/domain/entities/event.dart';

class EventModel extends Equatable {
  final String uid;
  final String name;
  final String cover;
  final String status; // Offline/ Online Event
  final String certificate;
  final int date;
  final double? latitude; //used to add [Navigate to Venue]
  final double? longitude; //used to add [Navigate to Venue]
  final List<String> perks;
  final bool registrationsOpen;
  final String?
      message; //to display any quick message to users. eg: [Registrations Extended Till 00-00-0000!]

  const EventModel(
      {required this.uid,
      required this.name,
      required this.cover,
      required this.status,
      required this.certificate,
      required this.date,
      required this.latitude,
      required this.longitude,
      required this.perks,
      required this.registrationsOpen,
      this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

  Event toEntity() => Event(
      uid: uid,
      name: name,
      cover: cover,
      status: status,
      certificate: certificate,
      date: date,
      location: latitude == null || longitude == null
          ? null
          : LatLng(latitude!, longitude!),
      perks: perks,
      registrationsOpen: registrationsOpen);
}
