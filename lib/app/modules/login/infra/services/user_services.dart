import 'dart:convert';
import 'package:nu_bank_clone/api/interfaces/i_base_api.dart';
import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_user_services.dart';
import 'package:nu_bank_clone/app/modules/login/errors/login_exception.dart';
import 'package:nu_bank_clone/app/modules/login/infra/models/create_user_model.dart';
import 'package:nu_bank_clone/core/extensions/either_extension.dart';

class UserServices implements IUserServices {
  final IBaseApi baseApi;

  UserServices(this.baseApi);

  @override
  Future<Either<LoginException, User>> createAccount(
      CreateUserModel model) async {
    try {
      final result = await baseApi.apiPost(
        '/users',
        model.toJson(),
      );

      if (result.isLeft()) {
        return Left(
          LoginException('An error ocurried when tried to create user'),
        );
      }

      return Right(
        User.fromJson(
          result.right(),
        ),
      );
    } catch (e) {
      return Left(LoginException('Error in login'));
    }
  }

  @override
  Future<Either<LoginException, User>> login(Login login) async {
    try {
      final result = await baseApi.apiPost(
        '/auth',
        login.toJson(),
      );

      if (result.isLeft()) {
        return Left(
          LoginException('An error ocurried when tried to create user'),
        );
      }

      final decodedJson = json.decode(result.right());
      final userJson = json.encode(decodedJson['user']);

      return Right(
        User.fromJson(
          userJson,
        ),
      );
    } catch (e) {
      return Left(LoginException('Error in login'));
    }
  }

  @override
  Future<Either<LoginException, bool>> logout() {
    throw UnimplementedError();
  }
}
