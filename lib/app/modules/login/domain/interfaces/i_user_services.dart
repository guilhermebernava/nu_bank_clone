import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/modules/login/errors/login_exception.dart';
import 'package:nu_bank_clone/app/modules/login/infra/models/create_user_model.dart';

abstract class IUserServices {
  Future<Either<LoginException, User>> login(Login login);
  Future<Either<LoginException, User>> createAccount(CreateUserModel model);
  Future<Either<LoginException, bool>> logout();
}
