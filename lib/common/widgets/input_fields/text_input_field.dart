import 'package:flutter/material.dart';

class TextInputFieldWidget extends StatefulWidget {
  const TextInputFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.textInputType,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType textInputType;

  @override
  State<TextInputFieldWidget> createState() => _TextInputFieldWidgetState();
}

class _TextInputFieldWidgetState extends State<TextInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: ThemeData().colorScheme.surface,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              size: 16,
              color: Color.fromARGB(255, 146, 5, 5),
            ),
            onPressed: () {
              widget.controller.clear();
            },
          ),
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ThemeData().colorScheme.primary,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: ThemeData().colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
