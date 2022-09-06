import 'package:nu_bank_clone/core/services/validators.dart';
import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class Telephone implements ValueObject {
  Telephone(this._value);
  String _value;

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Telefone não pode ser nulo!';
    }

    if (!Validators.isValidTelephone(_value)) {
      return 'Telefone inválido, use o modelo 11 90000-0000';
    }
    return null;
  }
}
