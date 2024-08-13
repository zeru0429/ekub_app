import 'package:ekub_app/features/login/bloc/login_bloc.dart';
import 'package:ekub_app/features/login/provider/login_provider.dart';
import 'package:ekub_app/features/login/repository/login_repository.dart';
import 'package:ekub_app/features/login/widget/login_form.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final http.Client _client;

  @override
  void initState() {
    super.initState();
    _client = http.Client();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginRepository:
            LoginRepository(loginProvider: LoginProvider(client: _client)),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 100),
                child: Text(
                  "Login ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: changeColorFromHex("#7F3DFF"),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox(child: LoginForm())),
          ],
        ),
      ),
    );
  }
}
