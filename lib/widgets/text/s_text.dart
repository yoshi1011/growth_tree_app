// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

class SText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;

  const SText(this.text,
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
        fontSize: 14,
        fontWeight: fontWeight,
      ),
    );
  }
}
