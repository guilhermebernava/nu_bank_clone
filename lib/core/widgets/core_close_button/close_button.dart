import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class CoreCloseButton extends StatelessWidget {
  final double iconSize;
  final bool isBack;

  const CoreCloseButton({
    Key? key,
    this.iconSize = 30,
    this.isBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          isBack ? Icons.arrow_back_rounded : Icons.close,
          color: AppColors.grey,
          size: iconSize,
        ),
      ),
    );
  }
}
