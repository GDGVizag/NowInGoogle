import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String uid;
  final String url;
  final String author;
  const Blog({
    required this.uid,
    required this.url,
    required this.author,
  });

  @override
  List<Object?> get props => [uid];
}
