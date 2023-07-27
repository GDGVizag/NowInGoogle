import 'package:equatable/equatable.dart';

class BlogModel extends Equatable {
  final String uid;
  final String url;
  final String author;
  const BlogModel({
    required this.uid,
    required this.url,
    required this.author,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}
