import 'package:nu_bank_clone/core/value_objects/interfaces/value_object.dart';

class GenericValue implements ValueObject {
  String _value;

  GenericValue(this._value);

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.toString() == '') {
      return 'Valor não pode ser nulo!';
    }
    return null;
  }
}
