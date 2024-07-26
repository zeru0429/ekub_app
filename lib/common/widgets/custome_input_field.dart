import 'package:flutter/material.dart';

class CustomeInputFieldWidget extends StatefulWidget {
  const CustomeInputFieldWidget(
      {super.key,
      required this.controller,
      required this.keyBordType,
      required this.label});
  final TextEditingController controller;
  final TextInputType keyBordType;
  final String label;

  @override
  State<CustomeInputFieldWidget> createState() =>
      _CustomeInCustomeInputFieldWidgetState();
}

class _CustomeInCustomeInputFieldWidgetState
    extends State<CustomeInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.name,
      controller: widget.controller,
      validator: (value) {},
    );
  }
}
