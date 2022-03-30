import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeaderWidget extends StatefulHookConsumerWidget implements PreferredSizeWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  HeaderWidgetState createState() => HeaderWidgetState();
}

class HeaderWidgetState extends ConsumerState<HeaderWidget> {

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(icon: const Icon(Icons.menu), color: GrowthTreeColors.darkGray, onPressed: _handleDrawerButton,),
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        semanticsLabel: 'logo',
        height: 35,
      ),
      centerTitle: false,
      actions: [
        Icon(Icons.notifications_outlined, color: GrowthTreeColors.darkGray, size: 36,),
        SizedBox(width: 15,),
        CircleAvatar(backgroundColor: Colors.black54,),
        SizedBox(width: 20,),
      ],
    );
  }
}
