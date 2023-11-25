abstract class ObsecureEvent {}

class ObsecureTextfield extends ObsecureEvent {
  final bool isObscure;

  ObsecureTextfield({required this.isObscure});
}
