import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/core/input_formatters/api_cpf_input_fromatter.dart';
import 'package:nu_bank_clone/core/services/bottom_sheet.dart';
import 'package:nu_bank_clone/core/value_objects/cpf.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/basics/body_bottom_sheet.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/core/widgets/core_input/core_input.dart';
import 'package:nu_bank_clone/core/widgets/core_text_button.dart';
import 'package:nu_bank_clone/core/widgets/login_button.dart/login_button.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ILoginUseCase loginUseCase = Get.find<LoginUseCase>();

    return BodyBottomSheet(
      size: size,
      children: [
        const CoreCloseButton(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: loginUseCase.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bom te ver novamente! Digite seu CPF para acessar o aplicativo',
                  style: AppTextStyle.titleLogin,
                ),
                const SizedBox(
                  height: 20,
                ),
                CoreInput(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ApiCpfInputFormatter(),
                  ],
                  initialValue: loginUseCase.loginModel.cpf.value,
                  hintText: '000.000.000.00',
                  validator: (_) => loginUseCase.loginModel.cpf.validator(),
                  onChanged: (val) => loginUseCase.loginModel.cpf = Cpf(val),
                ),
                CoreTextButton(
                  onTap: () {
                    Navigator.pop(context);
                    BottomSheetServices.createUser(context);
                  },
                  text: 'É novo por aqui? Pedir conta e cartão',
                ),
                SizedBox(height: size.height * 0.15),
                LoginButton(
                  callback: () async => loginUseCase.validateFirst(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
