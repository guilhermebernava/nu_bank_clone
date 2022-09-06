import 'dart:convert';
import 'package:nu_bank_clone/core/value_objects/cpf.dart';
import 'package:nu_bank_clone/core/value_objects/email.dart';
import 'package:nu_bank_clone/core/value_objects/full_name.dart';
import 'package:nu_bank_clone/core/value_objects/password.dart';
import 'package:nu_bank_clone/core/value_objects/telephone.dart';

class CreateUserModel {
  final FullName fullName;
  final Telephone telephone;
  final Email email;
  final Password password;
  final Cpf cpf;

  CreateUserModel({
    required this.cpf,
    required this.email,
    required this.fullName,
    required this.password,
    required this.telephone,
  });

  factory CreateUserModel.empty() {
    return CreateUserModel(
      cpf: Cpf(''),
      email: Email(''),
      fullName: FullName(''),
      password: Password(''),
      telephone: Telephone(''),
    );
  }

  String toJson() {
    return json.encode(<String, dynamic>{
      "fullName": fullName.value,
      "telephone": telephone.value,
      "email": email.value,
      "password": password.value,
      "cpf": cpf.value,
    });
  }
}
