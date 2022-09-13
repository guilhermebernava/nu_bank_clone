import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';

abstract class ILoginUseCase {
  Future<bool> login(BuildContext context);
  void logout();
  void validateFirst(BuildContext context);
  Future<void> recoverPassword();

  Login loginModel;
  GlobalKey<FormState> formKey;
  GlobalKey<FormState> secondFormKey;
  ILoginUseCase(this.loginModel, this.formKey, this.secondFormKey);
}
