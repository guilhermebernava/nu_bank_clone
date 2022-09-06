import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/create_user/create_user.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/login/login_bottom_sheet.dart';

class BottomSheetServices {
  static show(BuildContext context, Widget widget) {
    return showBottomSheet(
      enableDrag: true,
      context: context,
      builder: (context) => widget,
    );
  }

  static createUser(BuildContext context) {
    return showBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const CreateUserBottomSheet(),
    );
  }

  static login(BuildContext context) {
    return showBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => LoginBottomSheet(),
    );
  }
}
