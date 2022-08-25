import 'package:flutter/material.dart';

class AppMaterialColor {
  static const _color = 0xff820AD1;

  static const Map<int, Color> _colors = {
    50: Color.fromRGBO(130, 10, 209, .05),
    100: Color.fromRGBO(130, 10, 209, .1),
    200: Color.fromRGBO(130, 10, 209, .2),
    300: Color.fromRGBO(130, 10, 209, .3),
    400: Color.fromRGBO(130, 10, 209, .4),
    500: Color.fromRGBO(130, 10, 209, .5),
    600: Color.fromRGBO(130, 10, 209, .6),
    700: Color.fromRGBO(130, 10, 209, .7),
    800: Color.fromRGBO(130, 10, 209, .8),
    900: Color.fromRGBO(130, 10, 209, 9),
  };

  static const primary = MaterialColor(_color, _colors);
}
