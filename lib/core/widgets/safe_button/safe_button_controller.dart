import 'package:nu_bank_clone/core/widgets/safe_button/interfaces/i_safe_button_controller.dart';

class SafeButtonController implements ISafeButtonController {
  @override
  bool canClick = true;

  @override
  void protectButton(void Function(void Function() fn) setState, int seconds) {
    setState(() {
      canClick = false;
    });
    Future.delayed(Duration(seconds: seconds)).then((value) {
      setState(() {
        canClick = true;
      });
    });
  }
}
