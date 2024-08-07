import 'package:ekub_app/common/messager/scaffold_messager.dart';
import 'package:ekub_app/common/widgets/button/custom_button.dart';
import 'package:ekub_app/common/widgets/input_fields/password_field.dart';
import 'package:ekub_app/utils/color_convertor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Reset Password",
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
                PasswordFieldWidget(
                  controller: _passwordController,
                  label: "Password",
                  hint: "******",
                ),
                const SizedBox(height: 10),
                PasswordFieldWidget(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  hint: "******",
                ),
                const SizedBox(height: 20),
                RectangularButtonWidget(
                  titile: "Continue",
                  onTap: _submitForm,
                  textColor: Colors.white,
                  bgColor: changeColorFromHex("#7F3DFF"),
                ),
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
      if (_confirmPasswordController.text == _passwordController.text) {
        showMessage("passord reset sucessfully", context, MESSAGE_TYPE.SUCCESS);
        context.push('login');
      }
    }
  }
}
