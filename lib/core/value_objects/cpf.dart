import 'package:nu_bank_clone/core/services/validators.dart';
import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class Cpf implements ValueObject {
  String _value;
  Cpf(this._value);

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'CPF não pode ser nulo!';
    }

    if (!Validators.isValidCpf(_value)) {
      return 'CPF inválido!';
    }
    return null;
  }
}
