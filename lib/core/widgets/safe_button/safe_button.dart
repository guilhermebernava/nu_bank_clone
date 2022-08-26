import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button_controller.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class SafeButton extends StatefulWidget {
  final VoidCallback onTap;
  final double width;
  final Widget child;

  const SafeButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  State<SafeButton> createState() => _SafeButtonState();
}

class _SafeButtonState extends State<SafeButton> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Color?> _animation;
  final controller = Get.put(SafeButtonController());

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = ColorTween(
      begin: AppColors.primary,
      end: AppColors.primaryDark,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => GestureDetector(
        onTap: controller.canClick
            ? () {
                controller.protectButton(setState, 1);
                _animationController.forward().then((value) {
                  _animationController.reverse();
                });
                widget.onTap();
              }
            : null,
        onLongPress: controller.canClick
            ? () {
                controller.protectButton(setState, 1);
                _animationController.forward();
                widget.onTap();
              }
            : null,
        onLongPressEnd: (details) => _animationController.reverse(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          width: widget.width,
          decoration: BoxDecoration(
            color: _animation.value,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
