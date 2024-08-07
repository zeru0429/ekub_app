import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  final TextEditingController controller;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
      child: TextFormField(
        controller: controller,
        autocorrect: true,
        cursorHeight: 15,
        cursorColor: Colors.blueAccent,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          border: const OutlineInputBorder(
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
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email address';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}
