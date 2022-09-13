import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/basics/body_bottom_sheet.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';
import 'package:nu_bank_clone/core/widgets/core_input/core_input.dart';

class CreateUserBottomSheet extends StatelessWidget {
  const CreateUserBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BodyBottomSheet(
      size: size,
      children: [
        const CoreCloseButton(),
        Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CoreInput(
                initialValue: '',
                onChanged: (p0) {},
                hintText: '000.000.000.00',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
