import 'package:equatable/equatable.dart';

class BlogModel extends Equatable {
  final String id;
  final String url;
  final String author;
  const BlogModel({
    required this.id,
    required this.url,
    required this.author,
  });

  @override
  List<Object?> get props => [id];
}
