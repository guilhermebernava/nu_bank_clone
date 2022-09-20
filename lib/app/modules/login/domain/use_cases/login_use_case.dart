import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nu_bank_clone/app/modules/home/view/home_view.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_user_services.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/view/login_view.dart';
import 'package:nu_bank_clone/core/extensions/either_extension.dart';
import 'package:nu_bank_clone/core/services/bottom_sheet.dart';
import 'package:nu_bank_clone/core/services/snack_bar_services.dart';
import 'package:nu_bank_clone/core/services/validators.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class LoginUseCase implements ILoginUseCase {
  final IUserServices _loginServices;
  final IUserStore _userStore;

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();

  @override
  Login loginModel = Login.empty();

  LoginUseCase(
    this._loginServices,
    this._userStore,
  );

  @override
  void validateFirst(BuildContext context) {
    if (!Validators.validateForm(formKey)) {
      return;
    }
    BottomSheetServices.loginSecond(context);
  }

  @override
  Future<bool> login(BuildContext context) async {
    if (!Validators.validateForm(secondFormKey)) {
      return false;
    }

    await _loginServices.login(loginModel).then((result) {
      if (result.isLeft()) {
        SnackBarServices.showErrorSnackbar(context, 'CPF ou Senha incorretos!');
        return false;
      }

      _userStore.addUser(result.right());
      Navigator.of(context).pushReplacementNamed(HomeView.route);
    });

    return true;
  }

  @override
  Future<void> recoverPassword() async {
    return;
  }

  @override
  void logout() {
    _userStore.removeUser();
    Modular.to.navigate(LoginView.route);
  }
}
