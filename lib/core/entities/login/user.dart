import 'dart:convert';
import 'package:nu_bank_clone/core/entities/login/user_account.dart';

class User {
  final String cpf;
  String fullName;
  final String prefredName;
  String email;
  String telephone;
  String? profilePicture;
  double? montlhyRental;
  UserAccount? userAccount;

  User({
    required this.cpf,
    required this.fullName,
    required this.prefredName,
    required this.email,
    required this.telephone,
    this.montlhyRental,
    this.userAccount,
    this.profilePicture,
  });

  factory User.fromJson(String source) {
    final map = json.decode(source);
    return User(
      cpf: map['cpf'],
      email: map['email'],
      prefredName: map['preferredName'],
      fullName: map['fullName'],
      telephone: map['telephone'],
    );
  }

  factory User.empty() {
    return User(
      cpf: '',
      email: '',
      prefredName: '',
      fullName: '',
      telephone: '',
    );
  }
}
