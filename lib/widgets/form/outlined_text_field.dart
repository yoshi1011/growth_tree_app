import 'package:flutter/material.dart';

import '../../utils/colors.dart';
// TODO: widthが決まらないとエラーになるためContainerで囲っての利用が必須になっている仕様を変更する
class OutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
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
