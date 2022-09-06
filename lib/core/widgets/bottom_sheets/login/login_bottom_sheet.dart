import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/core/widgets/core_input/core_input.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class LoginBottomSheet extends StatelessWidget {
  final ILoginUseCase loginUseCase = Get.find<LoginUseCase>();
  LoginBottomSheet({Key? key}) : super(key: key);

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
                key: loginUseCase.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CoreInput(
                      controller: loginUseCase.cpfController,
                      hintText: '000.000.000.00',
                      validator: (value) => null,
                    ),
                    CoreInput(
                      controller: loginUseCase.passwordController,
                      hintText: '0000000',
                      validator: (value) => null,
                    ),
                    SafeButton(
                      onTap: () async => await loginUseCase.validateLogin(),
                      width: double.infinity,
                      child: Text(
                        'Entrar',
                        style: AppTextStyle.button,
                      ),
                    )
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
