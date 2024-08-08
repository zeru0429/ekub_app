import 'package:flutter/material.dart';

class DialogDropDownWidget extends StatefulWidget {
  final List<String> items;
  final String label;
  final String hint;
  final ValueChanged<String?> onChanged;
  final String initialValue;

  const DialogDropDownWidget({
    super.key,
    required this.items,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  State<DialogDropDownWidget> createState() => _DialogDropDownWidgetState();
}

class _DialogDropDownWidgetState extends State<DialogDropDownWidget> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: ThemeData().colorScheme.surface,
        border: Border.all(color: ThemeData().colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(widget.hint),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down,
              color: ThemeData().colorScheme.primary),
          iconSize: 24,
          style: TextStyle(
            color: ThemeData().colorScheme.primary,
            fontSize: 16,
          ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged(value);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: ThemeData().colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
