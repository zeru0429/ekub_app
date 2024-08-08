import 'package:flutter/material.dart';

class DialogTitileWidget extends StatelessWidget {
  const DialogTitileWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: ThemeData().colorScheme.primary,
        ),
      ),
    );
  }
}
