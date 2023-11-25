import 'package:project_4/models/user_model.dart';

abstract class UserEvent {
  final User user;

  UserEvent({required this.user});
}

class UpdateUserDetailsEvent extends UserEvent {
  UpdateUserDetailsEvent({required super.user});
}
