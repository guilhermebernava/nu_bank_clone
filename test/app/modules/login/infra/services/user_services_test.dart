import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/app/modules/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/modules/login/infra/models/create_user_model.dart';
import 'package:nu_bank_clone/app/modules/login/infra/services/user_services.dart';
import 'package:nu_bank_clone/core/value_objects/cpf.dart';
import 'package:nu_bank_clone/core/value_objects/email.dart';
import 'package:nu_bank_clone/core/value_objects/full_name.dart';
import 'package:nu_bank_clone/core/value_objects/password.dart';
import 'package:nu_bank_clone/core/value_objects/telephone.dart';

void main() {
  final mockUserServices = UserServices(
    BaseApi(
      BaseApiProps(
        apiUrl: 'https://bernava-finance-app.herokuapp.com',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  );
  test('user can login', () async {
    final res = await mockUserServices.login(
      Login(
        cpf: Cpf('479.377.328.14'),
        password: Password('!Asdf1904'),
      ),
    );

    expect(res.isRight(), true);
  });

  test('can craete a user', () async {
    final res = await mockUserServices.createAccount(
      CreateUserModel(
        cpf: Cpf('111.222.333.44'),
        email: Email('v@v.com'),
        fullName: FullName('Guilherme Testes'),
        password: Password('!Asdf1904'),
        telephone: Telephone('11 90000-0000'),
      ),
    );

    expect(res.isRight(), true);
  });

  test('user can\'t login', () async {
    final res = await mockUserServices.login(
      Login(
        cpf: Cpf('479.377.328.14'),
        password: Password('asdhadhasd'),
      ),
    );

    expect(res.isLeft(), true);
  });
}
