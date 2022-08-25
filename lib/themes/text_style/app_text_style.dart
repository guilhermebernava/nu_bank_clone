import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
}
