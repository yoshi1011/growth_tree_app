import 'package:flutter/material.dart';

import '../../utils/colors.dart';

@immutable
class TaskTypeIcon extends StatelessWidget {
  final IconData icon;
  final Color themeColor;

  const TaskTypeIcon({Key? key, required this.icon, required this.themeColor})
      : super(key: key);

  TaskTypeIcon.work()
      : icon = Icons.edit_note,
        themeColor = GrowthTreeColors.themeColor;
  TaskTypeIcon.task()
      : icon = Icons.done,
        themeColor = const Color(0xFF2196F3);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
