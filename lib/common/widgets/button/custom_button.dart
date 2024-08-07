import 'package:flutter/material.dart';

class RectangularButtonWidget extends StatelessWidget {
  const RectangularButtonWidget(
      {super.key,
      required this.titile,
      required this.onTap,
      required this.textColor,
      required this.bgColor});
  final String titile;
  final VoidCallback onTap;
  final Color textColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            titile,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
