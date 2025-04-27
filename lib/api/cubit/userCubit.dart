import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/api/repo/userRepo.dart';
import 'package:untitled/api/state/userState.dart';

class UserApiCubit extends Cubit<UserApiState> {
  final UserRepo userRepo;

  UserApiCubit(this.userRepo) : super(UserLoadingState());

  onLoadUsers() async {
    print('userload------------');
    try {
      emit(UserLoadingState());
      var data = await userRepo.getUsers();
      emit(UserLoadedState(data));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
