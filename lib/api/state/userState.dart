import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/api/model/userModel.dart';

abstract class UserApiState extends Equatable {
  const UserApiState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitial extends UserApiState {}

class UserLoadingState extends UserApiState {}

class UserLoadedState extends UserApiState {
  final List<UserModel> userModel;

  const UserLoadedState(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class UserErrorState extends UserApiState {
  final String? errorMessage;

  UserErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
