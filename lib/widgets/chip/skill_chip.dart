import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String name;
  final Color themeColor;

  const SkillChip({Key? key, required this.name, required this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: themeColor,
    );
  }
}
