import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String uid;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final int date;
  final List likes;
  final Map<String, Map<int, String>>
      comments; // {'UID':{'Timestamp':'Comment'}}

  const Post({
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
  // TODO: implement props
  List<Object?> get props => [uid];
}
