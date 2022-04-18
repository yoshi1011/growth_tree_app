import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';

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
      backgroundColor: Color(0xFFFF0000),
    );
  }
}
