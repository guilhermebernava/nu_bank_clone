import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class FullName implements ValueObject {
  FullName(this._value);
  String _value;

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Nome não pode ser nulo!';
    }

    if (_value.split(' ').length < 2) {
      return 'Nome precisa de um Sobrenome!';
    }
    return null;
  }
}
