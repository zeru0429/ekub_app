import 'package:ekub_app/common/messager/scaffold_messager.dart';
import 'package:ekub_app/common/widgets/button/custom_button.dart';
import 'package:ekub_app/common/widgets/input_fields/email_field.dart';
import 'package:ekub_app/common/widgets/input_fields/password_field.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
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
      body: Form(
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
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      showMessage("login", context, MESSAGE_TYPE.SUCCESS);
      context.go('/dashboard');
    }
  }
}
