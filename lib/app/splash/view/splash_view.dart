import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/splash/domain/interfaces/i_splash_use_case.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class SplashView extends StatefulWidget {
  final ISplashUseCase splashUseCase;
  const SplashView({
    Key? key,
    required this.splashUseCase,
  }) : super(key: key);

  static const route = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    widget.splashUseCase.loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.primary,
    );
  }
}
