import 'package:equatable/equatable.dart';

import '../../domain/entities/user_class.dart';

class UserModel extends Equatable {
  final String username;
  const UserModel({required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [username];

  User toEntity() => User(username: username);
}
