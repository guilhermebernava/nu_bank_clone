import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class SplashView extends StatefulWidget {
  final String routeTo;
  final int seconds;

  const SplashView({
    Key? key,
    required this.routeTo,
    required this.seconds,
  }) : super(key: key);

  static const route = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: widget.seconds)).then((value) {
      Get.toNamed(widget.routeTo);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.primary,
    );
  }
}
