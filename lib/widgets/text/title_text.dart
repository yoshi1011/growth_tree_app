// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color fontColor;

  const TitleText(this.text,
      {Key? key, this.fontColor = GrowthTreeColors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
