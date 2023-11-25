import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/user/bloc/user_event.dart';
import 'package:project_4/blocs/user/bloc/user_state.dart';
import 'package:project_4/data/global_data.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialState()) {
    on<UpdateUserDetailsEvent>((event, emit) {

      if (event.user.name!.isEmpty ||
          event.user.email!.isEmpty ||
          event.user.mobileNumber!.isEmpty ||
          event.user.password!.isEmpty) {
        //error state
        emit(ErrorState(message: "Please don't leave the field empty"));
      }
      if (event.user.name != currentUser.name) {
        usersList.where((element) {
          if (element.name == currentUser.name) {
            element.name = event.user.name;
          }
          return true;
        });
        emit(UpdateDetailsState());

        currentUser.name = event.user.name;
      }
      if (event.user.email != currentUser.email) {
        usersList.where((element) {
          if (element.email == currentUser.email) {
            element.email = event.user.email;
          }
          return true;
        });
        emit(UpdateDetailsState());
        currentUser.email = event.user.email;
      }
      if (event.user.mobileNumber != currentUser.mobileNumber) {
        usersList.where((element) {
          if (element.mobileNumber == currentUser.mobileNumber) {
            element.mobileNumber = event.user.mobileNumber;
          }
          return true;
        });
        emit(UpdateDetailsState());
        currentUser.mobileNumber = event.user.mobileNumber;
      }
      if (event.user.password != currentUser.password) {
        usersList.where((element) {
          if (element.password == currentUser.password) {
            element.password = event.user.password;
          }
          return true;
        });
        emit(UpdateDetailsState());
        currentUser.password = event.user.password;
      }
    });
  }
}
