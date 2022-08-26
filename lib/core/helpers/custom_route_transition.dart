import 'package:flutter/material.dart';

class CustomPageTransition extends PageTransitionsBuilder {
  static final builder = PageTransitionsTheme(builders: {
    TargetPlatform.android: CustomPageTransition(),
    TargetPlatform.iOS: CustomPageTransition(),
  });

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.name == '/') {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
