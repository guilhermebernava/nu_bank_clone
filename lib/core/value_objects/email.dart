import 'package:nu_bank_clone/core/services/validators.dart';
import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class Email implements ValueObject {
  Email(this._value);

  String _value;

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Email não pode ser nulo!';
    }

    if (!Validators.isValidEmail(_value)) {
      return 'Email inválido!';
    }
    return null;
  }
}
