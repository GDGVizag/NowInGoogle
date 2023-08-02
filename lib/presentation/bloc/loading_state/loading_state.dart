import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  final String message;
  const LoadingState(this.message);
  @override
  List<Object?> get props => [message];
}
