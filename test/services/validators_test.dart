import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/core/services/validators.dart';

void main() {
  test('Not Exist user', () {
    final isValid = Validators.existUser('');
    expect(isValid, false);
  });

  test('Valid CPF', () {
    final isValid = Validators.isValidCpf('479.377.328-14');
    expect(isValid, true);
  });

  test('Invalid CPF', () {
    final isValid = Validators.isValidCpf('47937732814');
    expect(isValid, false);
  });

  test('Valid Password', () {
    final isValid = Validators.isStrongPassword('12345678');
    expect(isValid, true);
  });

  test('Invalid Password', () {
    final isValid = Validators.isValidCpf('1234567');
    expect(isValid, false);
  });
}
