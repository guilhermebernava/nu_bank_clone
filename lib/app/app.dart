import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nu_bank_clone/core/helpers/custom_route_transition.dart';
import 'package:nu_bank_clone/l10n/l10n.dart';
import 'package:nu_bank_clone/themes/colors/app_material_color.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: L10n.delegates,
        supportedLocales: L10n.supportedLanguages,
        title: 'Nu Bank Clone',
        theme: ThemeData(
          pageTransitionsTheme: CustomPageTransition.builder,
          primarySwatch: AppMaterialColor.primary,
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      );
}
