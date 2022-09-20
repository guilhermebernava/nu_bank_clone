import 'package:flutter_modular/flutter_modular.dart';
import 'package:nu_bank_clone/app/modules/home/view/home_view.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class HomeModule extends Module {
  static const route = '/home/';
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomeView(
            userStore: Modular.get<UserStore>(),
          ),
        ),
      ];
}
