import 'package:flutter/material.dart';

class SignUp extends ChangeNotifier {
  var providerformKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool obscureText = false;

  onObsecure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  onUsernameSaved(String? value) {
    username = value!.trim();
  }

  onEmailSaved(String? value) {
    email = value!.trim();
  }

  onPasswordSaved(String? value) {
    password = value!.trim();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? emailValidator(String? value) {
    // if (value == null || value.isEmpty) {
    //   return 'Email is required';
    // }
    // return null;

    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
