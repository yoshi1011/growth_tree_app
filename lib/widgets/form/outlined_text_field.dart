// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

// TODO: widthが決まらないとエラーになるためContainerで囲っての利用が必須になっている仕様を変更する
class OutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  // Flutter Webにおいては効果が出る場面がなさそうだが、アプリ版への流用を想定して付与しておく
  final TextInputType textInputType;
  final bool isPass;
  final FormFieldValidator? validator;

  const OutlinedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.textInputType,
    this.isPass = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xffBBBBBB)),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GrowthTreeColors.themeColor, width: 2),
        ),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
