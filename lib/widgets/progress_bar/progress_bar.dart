import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ProgressBar extends StatelessWidget {
  final double progressRate;
  final double width;
  final double height;

  const ProgressBar(
      {Key? key,
      required this.progressRate,
      this.width = 180,
      this.height = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Color statusColor;
    if (progressRate > 0.7) {
      statusColor = GrowthTreeColors.themeColor;
    } else if (progressRate > 0.4) {
      statusColor = Colors.blue.shade800;
    } else {
      statusColor = Colors.red;
    }

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFDDDDDD),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: width * progressRate,
          height: height,
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
