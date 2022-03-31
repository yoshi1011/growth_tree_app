import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class SideMenuTile extends StatelessWidget {
  const SideMenuTile(
      this.menuName, {
        Key? key,
        required this.iconData,
      }) : super(key: key);

  final IconData iconData;
  final String menuName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            iconData,
            size: 25,
          ),
          const SizedBox(width: 15),
          Text(
            menuName,
            style: const TextStyle(
              fontSize: 16,
              color: GrowthTreeColors.darkGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
