import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/app/login/domain/entities/login.dart';
import 'package:nu_bank_clone/app/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/app/login/infra/services/login_services.dart';

void main() {
  final useCase = LoginUseCase(LoginServices());
  test('login sucess', () async {
    final result = await useCase.login(
      Login(
        cpf: '479.377.328-14',
        password: '12345678',
      ),
    );
    expect(result.isRight(), true);
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
