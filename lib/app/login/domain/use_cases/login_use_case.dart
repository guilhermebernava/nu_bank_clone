import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_services.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/login/errors/login_exception.dart';
import 'package:nu_bank_clone/app/login/infra/models/create_user_model.dart';
import 'package:nu_bank_clone/core/services/validators.dart';

class LoginUseCase implements ILoginUseCase {
  final ILoginServices _loginServices;

  LoginUseCase(
    this._loginServices,
  );
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  final cpfController = TextEditingController();
  @override
  final passwordController = TextEditingController();

  @override
  Future<void> validateLogin() async {
    if (!Validators.validateForm(formKey)) {
      return;
    }

    final result = await login(
      Login(cpf: cpfController.text, password: passwordController.text),
    );

    if (result.isLeft()) {
      //TO DO mostrar mensagem de erro
      return;
    }
    //TO DO logar usuário e ir para próxima pagina.
  }

  @override
  Future<Either<LoginException, User>> login(Login login) async {
    if (!isValidCpf(login.cpf) && !isValidPassword(login.password)) {
      return Left(LoginException('Invalid CPF or Password'));
    }
    return _loginServices.login(login);
  }

  @override
  Future<Either<LoginException, bool>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<LoginException, User>> createAccount(
      CreateUserModel model) async {
    if (!isValidPassword(model.password) && !isValidEmail(model.email)) {
      return Left(LoginException('Invalid Password or Email'));
    }
    return _loginServices.createAccount(model);
  }

  @override
  bool isValidCpf(String value) => Validators.isValidCpf(value);

  @override
  bool isValidPassword(String value) => Validators.isStrongPassword(value);

  @override
  bool isValidEmail(String value) => Validators.isValidEmail(value);
}
