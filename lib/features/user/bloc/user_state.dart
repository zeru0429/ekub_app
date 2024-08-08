// ignore_for_file: non_constant_identifier_names

import 'package:ekub_app/features/user/model/user_model.dart';
import 'package:equatable/equatable.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnUserState extends UserState {
  const UnUserState();

  @override
  String toString() => 'UnUserState';
}

/// Initialized
class InUserState extends UserState {
  const InUserState({required this.users});

  final List<UserModel> users;

  @override
  String toString() => 'InUserState';

  @override
  List<Object> get props => [users];
}

// Error state
class ErrorUserState extends UserState {
  const ErrorUserState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorUserState';

  @override
  List<Object> get props => [errorMessage];
}

// Loading state
class LoadingUserState extends UserState {
  const LoadingUserState();

  @override
  String toString() => 'LoadingUserState';

  @override
  List<Object> get props => [];
}

// message state
class SucessState extends UserState {
  const SucessState({required this.message});
  final String message;

  @override
  String toString() => 'Sucess User State';

  @override
  List<Object> get props => [];
}
