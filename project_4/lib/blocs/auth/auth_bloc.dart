import 'package:bloc/bloc.dart';
import 'package:project_4/blocs/auth/auth_event.dart';
import 'package:project_4/blocs/auth/auth_state.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<AuthEvent>((event, emit) {
      List doesExists = [];

      //Sign up
      on<SignupEvent>((event, emit) => () {
            if (event.email!.isEmpty) {
              ErrorState("Please enter your email");
            } else if (event.password!.isEmpty) {
              ErrorState("Please enter your password");
            } else {
              usersList.map((e) {
                if (e.email!.contains(event.email!.trim().toLowerCase())) {
                  doesExists.add(true);
                  ErrorState("This Email already have an account");
                }
              }).toList();
            }
            if (!doesExists.contains(true)) {
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
              // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const BottomNavBar()),(route) => false);
            }
          });
      //Sign in
      on<SigninEvent>((event, emit) => () {
            if (event.email!.isEmpty) {
              ErrorState("Please write your email");
            } else if (event.password!.isEmpty) {
              ErrorState("Please write your password");
            } else {
              usersList.map((e) {
                if (event.email!.trim().toLowerCase() ==
                        e.email!.toLowerCase() &&
                    event.password!.trim().toLowerCase() ==
                        e.password!.toLowerCase()) {
                  doesExists.add(true);
                  currentUser = e;
                  loggedInUsers.add(e);

                  emit(SigninState());
                  //Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const BottomNavBar()),(route) => false);

                  //add navigator on signin button on signin screen
                }
              }).toList();
              if (!doesExists.contains(true)) {
                // add scaffold mesanger
                ErrorState("This Account does not exist");
              }
            }
          });
    });
  }
}
