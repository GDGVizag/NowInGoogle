import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  const User({required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];
}
