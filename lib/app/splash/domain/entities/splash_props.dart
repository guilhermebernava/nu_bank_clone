import 'package:flutter/material.dart';

class SplashParams {
  final String route;
  final int secondsDuration;
  final BuildContext context;

  SplashParams({
    required this.route,
    required this.context,
    required this.secondsDuration,
  });
}
