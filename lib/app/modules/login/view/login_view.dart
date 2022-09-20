import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/login/widgets/login_buttons.dart';
import 'package:nu_bank_clone/core/widgets/safe_asset_image.dart';
import 'package:nu_bank_clone/themes/images/app_images.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeAssetImage(
            size: size,
            imagePath: AppImages.login2,
          ),
          Align(
            alignment: const Alignment(-0.8, 0.45),
            child: SizedBox(
              width: size.width * 0.7,
              child: Text(
                AppLocalizations.of(context)!.menuTitle,
                style: AppTextStyle.titleLoginView,
              ),
            ),
          ),
          // TextButton(
          //   child: const Text("Set locale to German"),
          //   onPressed: () => App.of(context).setLocale(
          //     const Locale.fromSubtags(languageCode: 'de'),
          //   ),
          // ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: LoginButtons(
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
