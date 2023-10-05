import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nowingoogle/domain/entities/event.dart';

class EventModel extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String poster; // who is conducting the event
  final String status; // Offline/ Online Event
  final String certificate;
  final int date;
  final double? latitude; //used to add [Navigate to Venue]
  final double? longitude; //used to add [Navigate to Venue]
  final List<String> perks;
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
    required this.certificate,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.perks,
    required this.registrationsOpen,
    this.message,
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
      status: status,
      certificate: certificate,
      date: date,
      location: latitude == null || longitude == null
          ? null
          : LatLng(latitude!, longitude!),
      perks: perks,
      registrationsOpen: registrationsOpen,
      message: message);
}
