import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String uid;
  final String name;
  final String cover;
  final String status; // Offline/ Online Event
  final String certificate;
  final int date;
  final String? latitude; //used to add [Navigate to Venue]
  final String? longitude; //used to add [Navigate to Venue]
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
}
