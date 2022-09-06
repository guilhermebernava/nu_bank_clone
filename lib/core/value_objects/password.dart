import 'package:nu_bank_clone/core/services/validators.dart';
import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class Password implements ValueObject {
  final String _value;

  Password(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Senha não pode ser nula!';
    }

    if (!Validators.isStrongPassword(_value)) {
      return 'Senha fraca demais';
    }

    return null;
  }
}
