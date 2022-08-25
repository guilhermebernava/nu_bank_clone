import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/colors/app_material_color.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nu Bank Clone',
      theme: ThemeData(
        primarySwatch: AppMaterialColor.primary,
      ),
      home: Container(),
    );
  }
}
