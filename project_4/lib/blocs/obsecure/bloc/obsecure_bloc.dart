import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_event.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_state.dart';

class ObsecureBloc extends Bloc<ObsecureEvent, ObsecureState> {
  ObsecureBloc() : super(InitialState(isObscure: true)) {
    on<ObsecureTextfield>((event, emit) {
      emit(ObsecurePassState(isObscure: event.isObscure));
    });
  }
}
