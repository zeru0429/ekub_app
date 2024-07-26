import 'package:flutter/material.dart';

class RemainingPaymentScreen extends StatelessWidget {
  const RemainingPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "RemainingPayment Screen",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
