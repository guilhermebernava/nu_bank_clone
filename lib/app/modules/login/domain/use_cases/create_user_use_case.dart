import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_create_user_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_user_services.dart';
import 'package:nu_bank_clone/app/modules/login/infra/models/create_user_model.dart';
import 'package:nu_bank_clone/app/modules/splash/view/splash_view.dart';
import 'package:nu_bank_clone/core/services/snack_bar_services.dart';
import 'package:nu_bank_clone/core/services/validators.dart';

class CreateUserUseCase implements ICreateUserUseCase {
  final IUserServices _loginServices;

  CreateUserUseCase(this._loginServices);

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  CreateUserModel model = CreateUserModel.empty();

  @override
  Future<void> createAccount(BuildContext context) async {
    if (!Validators.validateForm(formKey)) {
      SnackBarServices.showErrorSnackbar(context, 'Está faltando dados!');
      return;
    }

    await _loginServices.createAccount(model).then((result) {
      if (result.isLeft()) {
        SnackBarServices.showErrorSnackbar(
            context, 'Erro ao tentar criar seu usuário');
        return;
      }
      //TODO adicionar USER da STORE e ir para tela de HOME
      Get.toNamed(SplashView.route);
    });
  }
}
