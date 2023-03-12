// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../json_of_car/car.dart';
import '../../model/car_model.dart';

class DashBoard extends ChangeNotifier {
  var loginformKey = GlobalKey<FormState>();
  List<CarModel> cars = [];
  bool isBackPressedOnce = false;

  DashBoard() {
    getData();
  }
  String username = '';
  String password = '';
  final uNode = FocusNode();
  final pNode = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  getData() {
    //  getting dummy data from json
    for (var value in json) {
      var data = CarModel.fromJson(value);
      cars.add(data);
    }
  }

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

  Future<bool> onBackPressed(BuildContext context) {
    if (isBackPressedOnce) {
      exit(0);
    } else {
      isBackPressedOnce = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back button again to exit'),
        ),
      );
      Timer(const Duration(seconds: 2), () {
        isBackPressedOnce = false;
      });

      return Future.value(false);
    }
  }

  Future<void> login() async {}
}
