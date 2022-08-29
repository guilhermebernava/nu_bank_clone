import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/services/bottom_sheet.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class LoginButtons extends StatelessWidget {
  final Size size;

  const LoginButtons({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SafeButton(
          onTap: () => BottomSheetServices.createUser(context),
          width: size.width * 0.9,
          child: Text(
            'Começar',
            style: AppTextStyle.button,
          ),
        ),
        SafeButton(
          noBackground: true,
          onTap: () {},
          width: size.width * 0.9,
          child: Text(
            'Entrar com sua conta',
            style: AppTextStyle.textButton,
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        )
      ],
    );
  }
}
