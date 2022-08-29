import 'dart:isolate';

import 'package:nu_bank_clone/app/login/domain/entities/login.dart';

class Test {
  final SendPort port;
  final Login login;

  Test(this.port, this.login);
}
