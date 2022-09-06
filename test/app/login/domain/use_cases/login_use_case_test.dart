import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/app/login/infra/models/create_user_model.dart';
import 'package:nu_bank_clone/app/login/infra/services/login_services.dart';
import 'package:nu_bank_clone/core/extensions/either_extension.dart';

void main() {
  final useCase = LoginUseCase(
    LoginServices(
      BaseApi(
        BaseApiProps(
          apiUrl: 'https://bernava-finance-app.herokuapp.com',
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
    ),
  );

  test('should create user', () async {
    const cpf = '111.100.100.10';
    final result = await useCase.createAccount(
      CreateUserModel(
        cpf: cpf,
        email: 'ta11@ta.com',
        fullName: 'Guilherme Genuino Bernava',
        password: '!Asdf1904',
        telephone: '11 95389-0762',
      ),
    );

    assert(result.isRight(), true);
    final user = result.right();
    expect(user.cpf, cpf);
  });

  test('should have an error password or email', () async {
    const cpf = '111.100.100.10';
    final result = await useCase.createAccount(
      CreateUserModel(
        cpf: cpf,
        email: 'ta11@com',
        fullName: 'Guilherme Genuino Bernava',
        password: 'asdf1904',
        telephone: '11 95389-0762',
      ),
    );

    assert(result.isLeft(), true);
    expect(result.left().message, 'Invalid Password or Email');
  });

  test('should have an error creating user', () async {
    const cpf = '111.100.100.10';
    final result = await useCase.createAccount(
      CreateUserModel(
        cpf: cpf,
        email: 'ta11@ta.com',
        fullName: 'Guilherme Genuino Bernava',
        password: '!Asdf1904',
        telephone: '11 95389-0762',
      ),
    );

    assert(result.isLeft(), true);
    expect(
        result.left().message, 'An error ocurried when tried to create user');
  });

  test('login sucess', () async {
    final result = await useCase.login(
      Login(
        cpf: '479.377.328.14',
        password: '!Asdf1904',
      ),
    );
    expect(result.isRight(), true);
    final user = result.right();
    expect(user.cpf, '479.377.328.14');
  });

  test('login invalid inputs', () async {
    final result = await useCase.login(
      Login(
        cpf: '',
        password: '',
      ),
    );
    expect(result.isLeft(), true);
  });
}
