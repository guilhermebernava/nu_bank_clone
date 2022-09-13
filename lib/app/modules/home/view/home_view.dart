import 'package:flutter/material.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class HomeView extends StatelessWidget {
  final IUserStore _userStore;
  const HomeView({Key? key, required IUserStore userStore})
      : _userStore = userStore,
        super(key: key);

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_userStore.user.cpf),
          Text(_userStore.user.fullName),
        ],
      ),
    );
  }
}
