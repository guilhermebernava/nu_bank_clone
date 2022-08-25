import 'package:flutter/material.dart';
import '../../colors/app_colors.dart';

class AppTextStyleProps {
  final double fontSize;
  final Color color;
  final List<Shadow>? shadows;
  final FontWeight fontWeight;
  final TextDecoration? decoration;

  AppTextStyleProps({
    this.fontSize = 16,
    this.color = AppColors.black,
    this.shadows = const <Shadow>[],
    this.decoration = TextDecoration.none,
    this.fontWeight = FontWeight.w400,
  });
}
