abstract class ObsecureState {
  final bool isObscure;

  ObsecureState({required this.isObscure});
}

class InitialState extends ObsecureState {
  InitialState({required super.isObscure});
}
class ObsecurePassState extends ObsecureState {
  ObsecurePassState({required super.isObscure});
}
