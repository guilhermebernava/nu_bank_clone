import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class CanSeeInput extends StatelessWidget {
  final bool canSee;
  final VoidCallback onTap;

  const CanSeeInput({
    Key? key,
    required this.canSee,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        canSee ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
        color: AppColors.grey,
      ),
    );
  }
}
