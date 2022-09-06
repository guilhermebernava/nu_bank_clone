import 'package:get/route_manager.dart';
import 'package:nu_bank_clone/app/login/login_bindings.dart';
import 'package:nu_bank_clone/app/login/view/login_view.dart';
import 'package:nu_bank_clone/app/splash/view/splash_view.dart';

class AppRoutes {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: LoginView.route,
      page: () => const LoginView(),
      binding: LoginBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: SplashView.route,
      page: () => const SplashView(
        routeTo: LoginView.route,
        seconds: 2,
      ),
      transition: Transition.cupertino,
    ),
  ];
}
