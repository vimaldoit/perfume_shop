import 'package:flutter/material.dart';

class AppValidations {
  static void showSnackBar(BuildContext? context, String? value) {
    final snackBar = SnackBar(content: Text(value!));
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
}
