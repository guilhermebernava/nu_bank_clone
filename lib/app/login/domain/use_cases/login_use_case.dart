import 'package:nu_bank_clone/app/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_services.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/login/errors/login_exception.dart';
import 'package:nu_bank_clone/core/services/validators.dart';

class LoginUseCase implements ILoginUseCase {
  final ILoginServices _loginServices;

  LoginUseCase(this._loginServices);

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
  Future<Either<LoginException, User>> createAccount() {
    throw UnimplementedError();
  }

  @override
  bool isValidCpf(String value) => Validators.isValidCpf(value);

  @override
  bool isValidPassword(String value) => Validators.isStrongPassword(value);
}
