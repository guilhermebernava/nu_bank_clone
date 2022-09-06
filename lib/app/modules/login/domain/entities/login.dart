import 'dart:convert';

import 'package:nu_bank_clone/core/value_objects/cpf.dart';
import 'package:nu_bank_clone/core/value_objects/password.dart';

class Login {
  Cpf cpf;
  Password password;

  Login({
    required this.cpf,
    required this.password,
  });

  factory Login.empty() {
    return Login(
      cpf: Cpf(''),
      password: Password(''),
    );
  }

  String toJson() {
    return json.encode(<String, dynamic>{
      "password": password.value,
      "cpf": cpf.value,
      "rememberMe": true,
    });
  }
}
