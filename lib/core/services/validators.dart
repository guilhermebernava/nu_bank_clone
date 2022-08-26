class Validators {
  static bool isStrongPassword(String val) {
    final reg = RegExp(r'^[0-9]{8}');
    if (reg.hasMatch(val)) {
      return true;
    }
    return false;
  }

  static bool isValidCpf(String value) {
    final reg = RegExp(r"([0-9]{3}).([0-9]{3}).([0-9]{3})-([0-9]{2})");

    if (reg.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool existUser(String cpf) {
    if (cpf.isNotEmpty) {
      return true;
    }
    return false;
  }
}
