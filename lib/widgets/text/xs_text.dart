import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class XsText extends StatelessWidget {
  final String text;
  final Color fontColor;

  const XsText(this.text,
      {Key? key, this.fontColor = GrowthTreeColors.darkGray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
