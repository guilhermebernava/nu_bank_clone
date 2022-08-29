import 'package:nu_bank_clone/app/login/domain/entities/user.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/login/domain/entities/user_account.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_services.dart';
import 'package:nu_bank_clone/app/login/errors/login_exception.dart';

class LoginServices implements ILoginServices {
  @override
  Future<Either<LoginException, User>> createAccount() {
    throw UnimplementedError();
  }

  @override
  Future<Either<LoginException, User>> login(Login login) async {
    try {
      if (login.cpf != '479.377.328-14') {
        throw Error();
      }

      return Right(
        User(
          cpf: '479.377.328-14',
          fullName: 'Guilherme Bernava',
          prefredName: 'Guilherme',
          email: 'guilhermebernava00@gmail.com',
          telephone: '11 95389-0762',
          montlhyRental: 2000.0,
          userAccount: UserAccount(
            account: '000001',
            agency: '0001',
            balance: 100.10,
            bank: 'Nubank Pagamentos S&A',
            saveBalance: 0.0,
          ),
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
