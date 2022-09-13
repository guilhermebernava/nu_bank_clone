import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class SnackBarServices {
  static void showErrorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 100,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyle.textButton,
        ),
      ),
    );
  }
}
