import 'package:flutter/material.dart';

class DialogButtonWidget extends StatelessWidget {
  final String titile;
  final VoidCallback onTap;
  final Color color;
  const DialogButtonWidget({
    super.key,
    required this.titile,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(right: 10),
        child: Text(
          titile,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
