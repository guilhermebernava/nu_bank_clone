abstract class ISafeButtonController {
  bool canClick;
  void protectButton(void Function(void Function() fn) setState, int seconds);

  ISafeButtonController(this.canClick);
}
