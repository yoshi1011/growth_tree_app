import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../text/xs_text.dart';

class UnreadChip extends StatelessWidget {
  const UnreadChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Chip(
      label: XsText(
        '未読',
        fontColor: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      backgroundColor: GrowthTreeColors.red,
    );
  }
}
