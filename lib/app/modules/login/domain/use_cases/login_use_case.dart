import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_user_services.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/view/login_view.dart';
import 'package:nu_bank_clone/app/modules/splash/view/splash_view.dart';
import 'package:nu_bank_clone/core/services/snack_bar_services.dart';
import 'package:nu_bank_clone/core/services/validators.dart';

class LoginUseCase implements ILoginUseCase {
  final IUserServices _loginServices;
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Login loginModel = Login.empty();

  LoginUseCase(
    this._loginServices,
  );

  @override
  Future<void> login(BuildContext context) async {
    if (!Validators.validateForm(formKey)) {
      SnackBarServices.showErrorSnackbar(context, 'Falta CPF ou Senha !!');
      return;
    }

    await _loginServices.login(loginModel).then((result) {
      if (result.isLeft()) {
        SnackBarServices.showErrorSnackbar(context, 'CPF ou Senha Incorretos');
        return;
      }
      //TODO adicionar USER da STORE e ir para tela de HOME
      Get.toNamed(SplashView.route);
    });
  }

  @override
  void logout() {
    //TODO remover USER da STORE e voltar para tela de LOGIN
    Get.toNamed(LoginView.route);
  }
}
