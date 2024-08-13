import 'package:ekub_app/features/login/model/login_model.dart';
import 'package:ekub_app/features/login/provider/login_provider.dart';

class LoginRepository {
  final LoginProvider loginProvider;
  LoginRepository({required this.loginProvider});

  Future<Map<String, dynamic>> login(LoginModel loginModel) {
    return loginProvider.login(loginModel);
  }
}
