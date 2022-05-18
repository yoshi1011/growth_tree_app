// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

class OutlinedTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const OutlinedTextArea({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: labelText,
        // TODO: ラベルの位置を中央から上部に変更する
        labelStyle: const TextStyle(
          color: Color(0xffBBBBBB),
        ),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GrowthTreeColors.themeColor, width: 2),
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 5,
    );
  }
}
