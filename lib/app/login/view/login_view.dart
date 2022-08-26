import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/widgets/safe_asset_image.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/images/app_images.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:nu_bank_clone/themes/text_style/entity/app_text_theme_props.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SafeAssetImage(
            size: size,
            imagePath: AppImages.login,
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeButton(
                  onTap: () {},
                  width: size.width * 0.9,
                  child: Text(
                    'Começar',
                    style: AppTextStyle.appRobotoCondesend(
                      AppTextStyleProps(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
