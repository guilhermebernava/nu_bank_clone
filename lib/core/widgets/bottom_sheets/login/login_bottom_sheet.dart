import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/core/input_formatters/api_cpf_input_fromatter.dart';
import 'package:nu_bank_clone/core/value_objects/cpf.dart';
import 'package:nu_bank_clone/core/value_objects/password.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/core/widgets/core_input/core_input.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ILoginUseCase loginUseCase = Get.find<LoginUseCase>();

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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: loginUseCase.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CoreInput(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          ApiCpfInputFormatter(),
                        ],
                        initialValue: loginUseCase.loginModel.cpf.value,
                        hintText: '000.000.000.00',
                        validator: (_) =>
                            loginUseCase.loginModel.cpf.validator(),
                        onChanged: (val) =>
                            loginUseCase.loginModel.cpf = Cpf(val),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CoreInput(
                        initialValue: loginUseCase.loginModel.password.value,
                        hintText: '********',
                        validator: (_) =>
                            loginUseCase.loginModel.password.validator(),
                        onChanged: (val) =>
                            loginUseCase.loginModel.password = Password(val),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SafeButton(
                        onTap: () async {
                          await loginUseCase.login(context);
                        },
                        width: double.infinity,
                        child: Text(
                          'Entrar',
                          style: AppTextStyle.button,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
