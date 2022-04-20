import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/colors.dart';

class SideMenuTile extends ConsumerWidget {
  const SideMenuTile(
    this.menuName, {
    Key? key,
    required this.iconData,
    required this.pathName,
  }) : super(key: key);

  final IconData iconData;
  final String menuName;
  final String pathName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onTap: () => context.go(pathName),
    );
  }
}
