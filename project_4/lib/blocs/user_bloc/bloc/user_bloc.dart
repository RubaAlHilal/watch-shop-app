import 'package:bloc/bloc.dart';
import 'package:project_4/blocs/user_bloc/bloc/user_event.dart';
import 'package:project_4/blocs/user_bloc/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUser()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
