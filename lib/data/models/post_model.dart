import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String uid;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final int date;
  final List likes;
  final Map<String, Map<int, String>>
      comments; // {'UID':{'Timestamp':'Comment'}}

  const PostModel({
    required this.uid,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.date,
    required this.likes,
    required this.comments,
  });

  @override
  List<Object?> get props => [uid];
}
