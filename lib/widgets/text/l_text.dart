import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;

  const LText(this.text,
      {Key? key,
      this.fontColor = GrowthTreeColors.darkGray,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: 18,
        fontWeight: fontWeight,
      ),
    );
  }
}
