import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatterServices {
  static get cpfMask => MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
      );
}
