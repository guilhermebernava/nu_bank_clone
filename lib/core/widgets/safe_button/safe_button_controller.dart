import 'package:get/get_state_manager/get_state_manager.dart';

class SafeButtonController extends GetxController {
  bool canClick = true;

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
