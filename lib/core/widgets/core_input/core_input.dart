import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:nu_bank_clone/themes/text_style/entity/app_text_theme_props.dart';

class CoreInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String initialValue;

  const CoreInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      initialValue: initialValue,
      style: AppTextStyle.appRobotoCondesend(
        AppTextStyleProps(
          fontSize: 20,
        ),
      ),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
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
