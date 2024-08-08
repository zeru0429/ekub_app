import 'package:ekub_app/common/widgets/input_fields/email_field.dart';
import 'package:ekub_app/common/widgets/input_fields/password_field.dart';
import 'package:ekub_app/common/widgets/input_fields/text_input_field.dart';
import 'package:flutter/material.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  final _formKey = GlobalKey<FormState>();
  String gender = "MALE"; // Ensure this matches one of the initial values
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // First Name
            TextInputFieldWidget(
              controller: _firstNameController,
              label: "First Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            // Middle Name
            TextInputFieldWidget(
              controller: _middleNameController,
              label: "Middle Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
            // Last Name
            TextInputFieldWidget(
              controller: _lastNameController,
              label: "Last Name",
              hint: "John",
              textInputType: TextInputType.name,
            ),
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
          ],
        ),
      ),
    );
  }
}
