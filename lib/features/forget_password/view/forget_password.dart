import 'package:ekub_app/common/messager/scaffold_messager.dart';
import 'package:ekub_app/common/widgets/button/custom_button.dart';
import 'package:ekub_app/common/widgets/input_fields/email_field.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Forget Password",
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
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 50,
                  ),
                  child: const Wrap(
                    children: [
                      Text(
                        "Don’t worry. Enter your email and we’ll send you a link to reset your password.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                EmailFieldWidget(
                  controller: _emailController,
                  hint: "example@example.com",
                  label: 'Email',
                ),
                const SizedBox(height: 10),
                RectangularButtonWidget(
                  titile: "Continue",
                  onTap: _submitForm,
                  textColor: Colors.white,
                  bgColor: changeColorFromHex("#7F3DFF"),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/forget_password');
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
                      "I do have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push('/login');
                      },
                      child: Text(
                        "Sign In",
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
      // Perform login logic her
      showMessage("login", context, MESSAGE_TYPE.SUCCESS);
      context.push('/reset_password');
    }
  }
}
