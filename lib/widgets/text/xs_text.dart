// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

class XsText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextOverflow overflow;

  const XsText(this.text,
      {Key? key,
      this.fontColor = GrowthTreeColors.darkGray,
      this.fontWeight = FontWeight.bold,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: 10,
        fontWeight: fontWeight,
        overflow: overflow
      ),
    );
  }
}
