import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'entity/app_text_theme_props.dart';

class AppTextStyle {
  static TextStyle appRobotoCondesend(AppTextStyleProps props) {
    return GoogleFonts.robotoCondensed(
      fontSize: props.fontSize,
      color: props.color,
      fontWeight: props.fontWeight,
      shadows: props.shadows,
      decoration: props.decoration,
    );
  }

  static TextStyle button = AppTextStyle.appRobotoCondesend(
    AppTextStyleProps(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle textButton = AppTextStyle.appRobotoCondesend(
    AppTextStyleProps(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      shadows: [
        Shadow(
          blurRadius: 10,
          color: AppColors.black.withOpacity(0.2),
        )
      ],
    ),
  );

  static TextStyle titleLogin = AppTextStyle.appRobotoCondesend(
    AppTextStyleProps(
      fontSize: 35,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextStyle smallTextButton = AppTextStyle.appRobotoCondesend(
    AppTextStyleProps(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );
}
