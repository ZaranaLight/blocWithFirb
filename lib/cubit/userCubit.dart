import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user.dart';

import '../state/userState.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<User>> getUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((e) {
        return User(id: e.id, name: e['name'], email: e['email']);
      }).toList();
    });
  }

  void addUSer(User user) {
    _firestore.collection('users').add({
      'name': user.name,
      'email': user.email,
    });
  }

  void updateUSer(String? id, User user) {
    _firestore.collection('users').doc(id).update({
      'name': user.name,
      'email': user.email,
    });
  }

  void deleteUser(String id) {
    _firestore.collection('users').doc(id).delete();
  }

  // List<User> users = [];
  //
  // void addUser(User user) {
  //   users.add(user);
  //   emit(UserUpdated(users: users));
  // }
  //
  // void updateUser(String id, User updateUser) {
  //   users = users.map((e) => e.id == id ? updateUser : e).toList();
  //   emit(UserUpdated(users: users));
  // }

  // void deleteUser(String id) {
  //   users.removeWhere((element) => element.id == id);
  //   emit(UserUpdated(users: users));
  // }

  // void fetchUser() {
  //   emit(UserUpdated(users: users));
  // }
}
