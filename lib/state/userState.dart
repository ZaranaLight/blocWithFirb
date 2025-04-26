import '../model/user.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserUpdated extends UserState {
  late final List<User>? users;

  UserUpdated({this.users});
}
