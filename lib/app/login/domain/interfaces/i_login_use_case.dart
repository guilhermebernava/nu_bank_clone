import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/login/errors/login_exception.dart';
import 'package:nu_bank_clone/app/login/infra/models/create_user_model.dart';

abstract class ILoginUseCase {
  Future<Either<LoginException, User>> login(Login login);
  Future<Either<LoginException, User>> createAccount(CreateUserModel model);
  Future<Either<LoginException, bool>> logout();
  bool isValidCpf(String value);
  bool isValidPassword(String value);
  bool isValidEmail(String value);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> validateLogin();
}
