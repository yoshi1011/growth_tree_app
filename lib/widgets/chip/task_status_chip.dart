import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/text/m_text.dart';

class TaskStatusChip extends StatelessWidget {
  final String labelName;
  final Color themeColor;

  const TaskStatusChip({
    Key? key,
    required this.labelName,
    required this.themeColor,
  }) : super(key: key);

  TaskStatusChip.complete()
      : labelName = '完了',
        themeColor = GrowthTreeColors.themeColor;
  TaskStatusChip.check()
      : labelName = '確認',
        themeColor = GrowthTreeColors.yellow;
  TaskStatusChip.delay()
      : labelName = '遅れ',
        themeColor = GrowthTreeColors.red;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
      label: MText(
        labelName,
        fontColor: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      backgroundColor: themeColor,
    );
  }
}
