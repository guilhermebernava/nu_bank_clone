import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';

abstract class ILoginUseCase {
  Future<void> login(BuildContext context);
  void logout();

  Login loginModel;
  GlobalKey<FormState> formKey;
  ILoginUseCase(this.loginModel, this.formKey);
}
