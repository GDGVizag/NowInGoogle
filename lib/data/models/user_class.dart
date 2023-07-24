import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  const UserModel({required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [username];

  User toEntity() => User(username: username);
}

class User extends Equatable {
  final String username;
  const User({required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [username];
}
