import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/services/bottom_sheet.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.createAccount,
            style: AppTextStyle.button,
          ),
        ),
        SafeButton(
          noBackground: true,
          onTap: () => BottomSheetServices.login(context),
          width: size.width * 0.9,
          child: Text(
            AppLocalizations.of(context)!.enterAccount,
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
