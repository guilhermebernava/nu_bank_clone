import 'dart:convert';

class Login {
  String cpf;
  String password;

  Login({
    required this.cpf,
    required this.password,
  });
  String toJson() {
    return json.encode(<String, dynamic>{
      "password": password,
      "cpf": cpf,
      "rememberMe": true,
    });
  }
}
