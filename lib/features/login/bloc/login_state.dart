import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnLoginState extends LoginState {
  const UnLoginState();

  @override
  String toString() => 'UnLoginState';
}

/// UnInitialized
class LoadingLoginState extends LoginState {
  const LoadingLoginState();

  @override
  String toString() => 'LoadingLoginState';
}

/// Initialized
class InLoginState extends LoginState {
  const InLoginState({required this.token});

  final String token;

  @override
  String toString() => 'InLoginState ';

  @override
  List<Object> get props => [token];
}

class ErrorLoginState extends LoginState {
  const ErrorLoginState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState';

  @override
  List<Object> get props => [errorMessage];
}
