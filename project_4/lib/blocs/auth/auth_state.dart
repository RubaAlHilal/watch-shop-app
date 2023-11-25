abstract class AuthState {}

class InitialState extends AuthState {}

class SigninState extends AuthState {}

class SignupState extends AuthState {}

class ErrorState extends AuthState {
  final String message;

  ErrorState(this.message);
}


