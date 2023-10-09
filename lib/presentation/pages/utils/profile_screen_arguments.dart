import 'package:nowingoogle/domain/entities/user.dart';

class ProfileScreenArguments {
  final User user;
  final bool isSelfProfile;
  const ProfileScreenArguments({
    required this.user,
    required this.isSelfProfile,
  });
}
