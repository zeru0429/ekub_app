// ignore_for_file: use_build_context_synchronously

import 'package:ekub_app/common/messager/scaffold_messager.dart';
import 'package:ekub_app/features/login/bloc/login_bloc.dart';
import 'package:ekub_app/features/login/bloc/login_event.dart';
import 'package:ekub_app/features/login/bloc/login_state.dart';
import 'package:ekub_app/features/login/model/login_model.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:ekub_app/utils/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:ekub_app/common/widgets/button/custom_button.dart';
import 'package:ekub_app/common/widgets/input_fields/email_field.dart';
import 'package:ekub_app/common/widgets/input_fields/password_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is InLoginState) {
            showMessage("login sucessfully ", context, MESSAGE_TYPE.SUCCESS);
            await LocalDataStore.storeDataString('token', state.token);
            context.go('/admin_layout');
          } else if (state is ErrorLoginState) {
            showMessage(
                "Error: ${state.errorMessage}", context, MESSAGE_TYPE.FAILURE);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          EmailFieldWidget(
                            controller: _emailController,
                            hint: "example@example.com",
                            label: 'Email',
                          ),
                          const SizedBox(height: 10),
                          PasswordFieldWidget(
                            controller: _passwordController,
                            label: "Password",
                            hint: "******",
                          ),
                          const SizedBox(height: 20),
                          RectangularButtonWidget(
                            titile: "Login",
                            onTap: _submitForm,
                            textColor: Colors.white,
                            bgColor: changeColorFromHex("#7F3DFF"),
                          ),
                          TextButton(
                            onPressed: () {
                              context.push("/forget_password");
                            },
                            child: Text(
                              "Forget Password?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: changeColorFromHex("#7F3DFF"),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Wrap(
                            children: [
                              const Text(
                                "Do not have Account yet? ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.push('/signup');
                                },
                                child: Text(
                                  "Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: changeColorFromHex("#7F3DFF"),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //loding indicator
                if (state is LoadingLoginState)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      LoginModel loginModel = LoginModel(
          email: _emailController.text, password: _passwordController.text);
      context.read<LoginBloc>().add(LoadLoginEvent(loginModel: loginModel));
    }
  }
}
