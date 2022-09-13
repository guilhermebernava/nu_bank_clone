import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/app/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/core/animations/shake_widget.dart';
import 'package:nu_bank_clone/core/value_objects/password.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/basics/body_bottom_sheet.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/core/widgets/core_input/core_input.dart';
import 'package:nu_bank_clone/core/widgets/core_text_button.dart';
import 'package:nu_bank_clone/core/widgets/login_button.dart/login_button.dart';
import 'package:nu_bank_clone/themes/text_style/app_text_style.dart';

class LoginSecondBottomSheet extends StatefulWidget {
  const LoginSecondBottomSheet({Key? key}) : super(key: key);

  @override
  State<LoginSecondBottomSheet> createState() => _LoginSecondBottomSheetState();
}

class _LoginSecondBottomSheetState extends State<LoginSecondBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ILoginUseCase loginUseCase = Get.find<LoginUseCase>();
    final shakeKey = GlobalKey<ShakeWidgetState>();

    return Wrap(
      children: [
        BodyBottomSheet(
          size: size,
          children: [
            const CoreCloseButton(
              isBack: true,
            ),
            ShakeWidget(
              // 4. pass the GlobalKey as an argument
              key: shakeKey,
              // 5. configure the animation parameters
              shakeCount: 3,
              shakeOffset: 10,
              shakeDuration: const Duration(milliseconds: 400),
              // 6. Add the child widget that will be animated
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: loginUseCase.secondFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coloque sua senha, \nou clique em \n"Esqueceu sua senha ?"',
                        style: AppTextStyle.titleLogin,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CoreInput(
                        isPassword: true,
                        initialValue: loginUseCase.loginModel.password.value,
                        hintText: '********',
                        validator: (_) =>
                            loginUseCase.loginModel.password.validator(),
                        onChanged: (val) =>
                            loginUseCase.loginModel.password = Password(val),
                      ),
                      CoreTextButton(
                        onTap: () {
                          Navigator.pushNamed(context, '/teste');
                        },
                        text: 'Esqueceu sua senha ?',
                      ),
                      LoginButton(
                        callback: () async {
                          final sucess = await loginUseCase.login(context);

                          if (sucess) {
                            shakeKey.currentState?.shake();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
