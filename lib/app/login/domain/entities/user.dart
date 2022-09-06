import 'dart:convert';
import 'package:nu_bank_clone/app/login/domain/entities/user_account.dart';

class User {
  final String cpf;
  final String fullName;
  final String prefredName;
  final String email;
  final String telephone;
  final String? profilePicture;
  final double? montlhyRental;
  final UserAccount? userAccount;

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
}
