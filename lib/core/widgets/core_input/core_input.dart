import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nu_bank_clone/core/widgets/can_see_input.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:nu_bank_clone/themes/text_style/entity/app_text_theme_props.dart';

class CoreInput extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String initialValue;
  final bool isPassword;

  const CoreInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    required this.initialValue,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CoreInput> createState() => _CoreInputState();
}

class _CoreInputState extends State<CoreInput> {
  late bool canSee;
  @override
  void initState() {
    canSee = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: canSee,
      onChanged: widget.onChanged,
      validator: widget.validator,
      initialValue: widget.initialValue,
      style: AppTextStyle.appRobotoCondesend(
        AppTextStyleProps(
          fontSize: 20,
        ),
      ),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? CanSeeInput(
                canSee: canSee,
                onTap: () => setState(() {
                  canSee = !canSee;
                }),
              )
            : null,
        hintText: widget.hintText,
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
