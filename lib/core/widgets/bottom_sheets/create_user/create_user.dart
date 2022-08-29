import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/services/input_formatters.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';
import 'package:nu_bank_clone/themes/text_style/entity/app_text_theme_props.dart';

class CreateUserBottomSheet extends StatelessWidget {
  const CreateUserBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.92,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CoreCloseButton(),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
