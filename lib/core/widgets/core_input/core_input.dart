import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/services/input_formatters.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:nu_bank_clone/themes/text_style/entity/app_text_theme_props.dart';

class CoreInput extends StatelessWidget {
  const CoreInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.appRobotoCondesend(
        AppTextStyleProps(
          fontSize: 20,
        ),
      ),
      inputFormatters: [
        InputFormatterServices.cpfMask,
      ],
      decoration: InputDecoration(
        hintText: '000.000.000-00',
        hintStyle: AppTextStyle.appRobotoCondesend(
          AppTextStyleProps(
            color: AppColors.grey,
            fontSize: 20,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
