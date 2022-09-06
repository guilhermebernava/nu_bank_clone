import 'package:flutter/material.dart';

class LoadingParams {
  final String route;
  final int secondsDuration;
  final BuildContext context;

  LoadingParams({
    required this.route,
    required this.context,
    required this.secondsDuration,
  });
}
