// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../session/user_session.dart';
import '../dashboard/dashboard_vu.dart';

class Login extends ChangeNotifier {
  var loginformKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool obscureText = false;

  onUsernameSaved(String? value) {
    username = value!.trim();
    notifyListeners();
  }

  onPasswordSaved(String? value) {
    password = value!.trim();
    notifyListeners();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  onObsecure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    loginformKey.currentState!.save();
    if (loginformKey.currentState!.validate()) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
      } else {}

      //    storing user session on login...

      Map<String, dynamic> userSession = {"key": username, "token": password};
      var session = await UserSession().saveSession(userSession);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashBoardScreen()));
    }
  }
}
