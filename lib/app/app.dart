import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nu_bank_clone/app/app_bindings.dart';
import 'package:nu_bank_clone/app/routes/app_routes.dart';
import 'package:nu_bank_clone/app/splash/view/splash_view.dart';
import 'package:nu_bank_clone/core/helpers/custom_route_transition.dart';
import 'package:nu_bank_clone/themes/colors/app_material_color.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nu Bank Clone',
        theme: ThemeData(
          pageTransitionsTheme: CustomPageTransition.builder,
          primarySwatch: AppMaterialColor.primary,
        ),
        initialRoute: SplashView.route,
        initialBinding: AppBindings(),
        getPages: AppRoutes.pages,
      );
}
