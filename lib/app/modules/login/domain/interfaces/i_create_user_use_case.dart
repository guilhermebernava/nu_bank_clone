import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/login/infra/models/create_user_model.dart';

abstract class ICreateUserUseCase {
  Future<void> createAccount(BuildContext context);
  CreateUserModel model;
  GlobalKey<FormState> formKey;

  ICreateUserUseCase(this.model, this.formKey);
}
