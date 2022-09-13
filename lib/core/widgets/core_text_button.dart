import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class CoreTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CoreTextButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: AppTextStyle.smallTextButton,
      ),
    );
  }
}
