// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

enum MESSAGE_TYPE { SUCCESS, FAILURE, WARNING }

void showMessage(String message, BuildContext context, MESSAGE_TYPE type) {
  final snackBar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
          Icon(
            type == MESSAGE_TYPE.SUCCESS
                ? Icons.check_circle_outline
                : type == MESSAGE_TYPE.WARNING
                    ? Icons.warning_amber_outlined
                    : Icons.error_outline,
            color: Colors.white,
          ),
        ],
      ),
    ),
    backgroundColor: type == MESSAGE_TYPE.SUCCESS
        ? Colors.green
        : type == MESSAGE_TYPE.WARNING
            ? Colors.amber.shade500
            : Colors.red,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
