import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/splash/domain/entities/loading_params.dart';
import 'package:nu_bank_clone/app/splash/domain/use_cases/splash_use_case.dart';
import 'package:nu_bank_clone/app/splash/infra/services/route_services.dart';
import 'package:nu_bank_clone/app/splash/view/splash_view.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/colors/app_material_color.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nu Bank Clone',
      theme: ThemeData(
        primarySwatch: AppMaterialColor.primary,
      ),
      initialRoute: SplashView.route,
      routes: {
        SplashView.route: (ctx) => SplashView(
              splashUseCase: SplashUseCase(
                RouteServices(),
                LoadingParams(
                  context: ctx,
                  route: '/home',
                  secondsDuration: 2,
                ),
              ),
            ),
        '/home': (context) => const Material(
              color: AppColors.black,
            ),
      },
    );
  }
}
