import 'package:ekub_app/features/login/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class LoginEvent extends Equatable {}

class UnLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoadLoginEvent extends LoginEvent {
  final LoginModel loginModel;
  LoadLoginEvent({required this.loginModel});
  @override
  List<Object?> get props => [];
}
