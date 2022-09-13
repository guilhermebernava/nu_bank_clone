import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/login/widgets/login_buttons.dart';
import 'package:nu_bank_clone/core/widgets/safe_asset_image.dart';
import 'package:nu_bank_clone/themes/images/app_images.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeAssetImage(
            size: size,
            imagePath: AppImages.login,
          ),
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
