import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';
import 'package:project_4/data/global_data.dart';

import 'package:project_4/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    List doesExists = [];
    bool isMatched = false;

    //Sign up
    on<SignupEvent>((event, emit) {
      if (event.email!.isEmpty) {
        emit(ErrorState("Please enter your email"));
      } else if (event.password!.isEmpty) {
        emit(ErrorState("Please enter your password"));
      } else if (event.name!.isEmpty) {
        emit(ErrorState("Please enter your name"));
      } else {
        for (var user in usersList) {
          if (user.email == event.email) {
            isMatched = true;
            emit(ErrorState("This Email already have an account"));
          }
        }
      }
      if (!isMatched) {
        currentUser = User(
            address: [],
            userAvatar: "",
            email: event.email!.trim(),
            password: event.password!.trim(),
            mobileNumber: '',
            name: event.name!.trim());
        loggedInUsers.add(currentUser);
        usersList.add(currentUser);
        emit(SignupState());
      }
    });

    //Sign in
    on<SigninEvent>((event, emit) {
      if (event.email!.isEmpty) {
        emit(ErrorState("Please write your email"));
      } else if (event.password!.isEmpty) {
        emit(ErrorState("Please write your password"));
      } else {
        usersList.map((e) {
          if (event.email!.trim().toLowerCase() == e.email!.toLowerCase() &&
              event.password!.trim().toLowerCase() ==
                  e.password!.toLowerCase()) {
            doesExists.add(true);
            currentUser = e;
            loggedInUsers.add(e);
            emit(SigninState());
          }
        }).toList();

        if (!doesExists.contains(true)) {
          emit(ErrorState("This Account does not exist"));
        }
      }
    });
  }
}
