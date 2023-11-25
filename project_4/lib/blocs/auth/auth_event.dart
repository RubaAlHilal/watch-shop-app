abstract class AuthEvent {}

class SigninEvent extends AuthEvent {
  final String? email;
  final String? password;

  SigninEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;

  SignupEvent(this.name, this.email, this.password);
}

