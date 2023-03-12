// ignore_for_file: use_build_context_synchronously

import 'package:demo/model/car_model.dart';
import 'package:flutter/material.dart';

class CarForm extends ChangeNotifier {
  CarForm(this.model);
  CarModel? model;
  List<String> modelStrings = [];
  var loginformKey = GlobalKey<FormState>();
  String username = '';

  changeColorDropDownValue(CarModel? model, String? value) {
    model!.color = value!;
    notifyListeners();
  }

  changeModelDropDownValue(String? value) {
    model!.model = value!;
    notifyListeners();
  }

  onUsernameSaved(String? value) {
    username = value!.trim();
    notifyListeners();
  }

  onRegNoSaved(CarModel model, String? value) {
    model.registrationNo = value!.trim();
    notifyListeners();
  }

  onCategorySaved(CarModel model, String? value) {
    model.category = value!.trim();
    notifyListeners();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? regNoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? colorValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Select Color') {
      return 'Color is required';
    }
    return null;
  }

  String? modelValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Select Model') {
      return 'Model is required';
    }
    return null;
  }

  String? categoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category is required';
    }
    return null;
  }
}
