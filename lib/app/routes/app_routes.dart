import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/home/view/home_view.dart';
import 'package:nu_bank_clone/app/modules/login/login_bindings.dart';
import 'package:nu_bank_clone/app/modules/login/view/login_view.dart';
import 'package:nu_bank_clone/app/modules/splash/view/splash_view.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

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
    GetPage(
      name: HomeView.route,
      page: () => HomeView(
        userStore: Get.find<UserStore>(),
      ),
    ),
  ];
}
