abstract class UserState {}

class InitialState extends UserState {}

class UpdateDetailsState extends UserState {}

class ErrorState extends UserState {
  final String message;

  ErrorState({required this.message});
}
