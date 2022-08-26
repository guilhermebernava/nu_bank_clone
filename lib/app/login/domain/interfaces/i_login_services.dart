import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/login/errors/login_exception.dart';

abstract class ILoginServices {
  Future<Either<LoginException, User>> login(Login login);
  Future<Either<LoginException, User>> createAccount();
  Future<Either<LoginException, bool>> logout();
}
