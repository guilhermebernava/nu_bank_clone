import 'dart:convert';

class CreateUserModel {
  final String fullName;
  final String telephone;
  final String email;
  final String password;
  final String cpf;

  CreateUserModel({
    required this.cpf,
    required this.email,
    required this.fullName,
    required this.password,
    required this.telephone,
  });

  String toJson() {
    return json.encode(<String, dynamic>{
      "fullName": fullName,
      "telephone": telephone,
      "email": email,
      "password": password,
      "cpf": cpf,
    });
  }
}
