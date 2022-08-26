import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/login/view/login_view.dart';
import 'package:nu_bank_clone/app/splash/domain/entities/loading_params.dart';
import 'package:nu_bank_clone/app/splash/domain/use_cases/splash_use_case.dart';
import 'package:nu_bank_clone/app/splash/infra/services/route_services.dart';
import 'package:nu_bank_clone/app/splash/view/splash_view.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> call() => {
        SplashView.route: (ctx) => SplashView(
              splashUseCase: SplashUseCase(
                RouteServices(),
                LoadingParams(
                  context: ctx,
                  route: LoginView.route,
                  secondsDuration: 2,
                ),
              ),
            ),
        LoginView.route: (context) => const LoginView(),
      };
}
