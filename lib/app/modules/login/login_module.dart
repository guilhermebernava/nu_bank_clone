import 'package:flutter_modular/flutter_modular.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/app/modules/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/infra/services/user_services.dart';
import 'package:nu_bank_clone/app/modules/login/view/login_view.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class LoginModule extends Module {
  static const route = '/login${LoginView.route}';

  @override
  List<Bind<Object>> get binds => [
        Bind.factory(
          (i) => LoginUseCase(
            UserServices(
              i.get<BaseApi>(),
            ),
            i.get<UserStore>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginView.route,
          child: (_, __) => const LoginView(),
        ),
      ];
}
