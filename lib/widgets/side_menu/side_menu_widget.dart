import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:growth_tree_app/widgets/side_menu/side_menu_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenuWidget extends StatefulHookConsumerWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  SideMenuWidgetState createState() => SideMenuWidgetState();
}

class SideMenuWidgetState extends ConsumerState<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  semanticsLabel: 'logo',
                  height: 35,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          const SideMenuTile('ダッシュボード', iconData: Icons.home, pathName: '/',),
          const SideMenuTile('カリキュラム', iconData: Icons.calendar_month, pathName: '/curriculums',),
          const SideMenuTile('ミッション', iconData: Icons.assignment_late_outlined, pathName: '/'),
          const SideMenuTile('スキル', iconData: Icons.psychology, pathName: '/'),
          const SideMenuTile('メンバー', iconData: Icons.groups, pathName: '/'),
          const SideMenuTile('アカウント', iconData: Icons.person, pathName: '/'),
          const SideMenuTile('管理者設定', iconData: Icons.corporate_fare, pathName: '/'),
          const SideMenuTile('ログアウト', iconData: Icons.logout, pathName: '/'),
        ],
      ),
    );
  }
}
