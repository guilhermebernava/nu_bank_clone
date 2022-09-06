import 'package:flutter/material.dart';

class Validators {
  static bool isStrongPassword(String val) {
    final reg = RegExp(r'^[0-9]{8}');
    if (reg.hasMatch(val)) {
      return true;
    }
    return false;
  }

  static bool isValidCpf(String value) {
    final reg = RegExp(r"([0-9]{3}).([0-9]{3}).([0-9]{3}).([0-9]{2})");

    if (reg.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool isValidEmail(String value) {
    bool valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!valid) return false;
    return true;
  }

  static bool existUser(String cpf) {
    if (cpf.isNotEmpty) {
      return true;
    }
    return false;
  }

  static bool validateForm(GlobalKey<FormState> formKey) {
    final formState = formKey.currentState;

    if (formState == null) {
      return false;
    }

    if (!formState.validate()) {
      return false;
    }

    return true;
  }
}
