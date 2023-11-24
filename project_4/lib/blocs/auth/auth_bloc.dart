import 'package:bloc/bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
