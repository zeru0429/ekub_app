import 'package:bloc/bloc.dart';
import 'package:ekub_app/features/login/bloc/index.dart';
import 'package:ekub_app/features/login/repository/login_repository.dart';
import 'package:ekub_app/utils/exception%20function.dart';
import 'package:flutter/services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const UnLoginState()) {
    on<LoadLoginEvent>((event, emit) async {
      emit(const LoadingLoginState());
      try {
        final result = await loginRepository.login(event.loginModel);
        emit(InLoginState(token: result['token']));
      } catch (e) {
        String errorMessage;
        if (e is PlatformException) {
          errorMessage = e.message ?? 'An unknown error occurred';
        } else {
          errorMessage = extractErrorMessage(e.toString());
        }
        emit(ErrorLoginState(errorMessage));
      }
    });
  }
}
