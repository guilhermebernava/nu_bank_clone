import 'package:flutter/material.dart';
import 'package:nu_bank_clone/core/widgets/safe_button/safe_button_controller.dart';
import 'package:nu_bank_clone/themes/colors/app_colors.dart';

class SafeButton extends StatefulWidget {
  final VoidCallback onTap;
  final double width;
  final Widget child;
  final bool noBackground;

  const SafeButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.child,
    this.noBackground = false,
  }) : super(key: key);

  @override
  State<SafeButton> createState() => _SafeButtonState();
}

class _SafeButtonState extends State<SafeButton> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animation;
  final controller = SafeButtonController();

  @override
  void initState() {
    if (widget.noBackground) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 270),
      );
      _animation = Tween(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear),
      );
    } else {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      );
      _animation = ColorTween(
        begin: AppColors.primary,
        end: AppColors.primaryDark,
      ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear));
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.noBackground) {
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
          onLongPressEnd: (_) => _animationController.reverse(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Opacity(
              opacity: _animation.value,
              child: Center(
                child: widget.child,
              ),
            ),
          ),
        ),
      );
    } else {
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
          onLongPressEnd: (_) => _animationController.reverse(),
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
}
