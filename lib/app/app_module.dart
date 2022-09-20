import 'package:flutter_modular/flutter_modular.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/app/modules/home/home_module.dart';
import 'package:nu_bank_clone/app/modules/login/login_module.dart';
import 'package:nu_bank_clone/app/modules/splash/view/splash_view.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => BaseApi(
            BaseApiProps(
              apiUrl: 'https://bernava-finance-app.herokuapp.com',
              headers: {
                'Content-Type': 'application/json',
              },
            ),
          ),
        ),
        Bind.singleton(
          (i) => UserStore(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SplashView(
            routeTo: LoginModule.route,
            seconds: 2,
          ),
        ),
        ModuleRoute(
          LoginModule.route,
          module: LoginModule(),
        ),
        ModuleRoute(
          HomeModule.route,
          module: HomeModule(),
        )
      ];
}
