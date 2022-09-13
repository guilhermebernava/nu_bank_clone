import 'package:flutter/material.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class LoginButton extends StatefulWidget {
  final Future<void> Function() callback;

  const LoginButton({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            await widget.callback().then((value) {
              setState(() {
                isLoading = false;
              });
            });
          },
          backgroundColor: AppColors.primary,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 4,
                )
              : const Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                ),
        ),
      ],
    );
  }
}
