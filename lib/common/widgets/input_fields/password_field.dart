import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.borderType = BorderType.rounded,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final BorderType borderType;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        autocorrect: false,
        cursorHeight: 15,
        cursorColor: Colors.blueAccent,
        decoration: InputDecoration(
          hintText: widget.hint,
          label: Text(widget.label),
          border: _getBorder(),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.blueAccent,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          if (!_isValidPassword(value)) {
            return 'Password must contain at least 2 uppercase, 2 lowercase, 2 digits, and 1 special character';
          }
          return null;
        },
      ),
    );
  }

  InputBorder _getBorder() {
    switch (widget.borderType) {
      case BorderType.rounded:
        return const OutlineInputBorder(
          gapPadding: 4,
          borderSide: BorderSide(
            color: Colors.blueAccent,
            style: BorderStyle.solid,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        );
      case BorderType.rectangular:
        return const OutlineInputBorder(
          gapPadding: 4,
          borderSide: BorderSide(
            color: Colors.blueAccent,
            style: BorderStyle.solid,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        );
      case BorderType.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            style: BorderStyle.solid,
            width: 2,
          ),
        );
    }
  }

  bool _isValidPassword(String password) {
    int uppercaseCount = 0;
    int lowercaseCount = 0;
    int digitCount = 0;
    int specialCharCount = 0;

    for (int i = 0; i < password.length; i++) {
      if (RegExp(r'[A-Z]').hasMatch(password[i])) {
        uppercaseCount++;
      } else if (RegExp(r'[a-z]').hasMatch(password[i])) {
        lowercaseCount++;
      } else if (RegExp(r'[0-9]').hasMatch(password[i])) {
        digitCount++;
      } else if (!RegExp(r'[A-Za-z0-9]').hasMatch(password[i])) {
        specialCharCount++;
      }
    }

    return uppercaseCount >= 2 &&
        lowercaseCount >= 2 &&
        digitCount >= 2 &&
        specialCharCount >= 1;
  }
}

enum BorderType {
  rounded,
  rectangular,
  underlined,
}
