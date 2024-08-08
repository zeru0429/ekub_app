// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/user/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
sealed class UserEvent {}

class UnUserEvent extends UserEvent {}

class FetchUserEvent extends UserEvent {
  final int skip, take;
  FetchUserEvent({required this.take, required this.skip});
}

class FetchSingleUserEvent extends UserEvent {
  final int id;
  FetchSingleUserEvent({required this.id});
}

class AddUserEvent extends UserEvent {
  final UserModel user;
  AddUserEvent({required this.user});
}

class UpdateUserEvent extends UserEvent {
  final UserModel user;
  UpdateUserEvent({required this.user});
}

class DeleteUserEvent extends UserEvent {
  final int id;
  DeleteUserEvent({required this.id});
}
