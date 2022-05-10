import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/user_provider.dart';
import '../../utils/utils.dart';
import 'side_menu_tile.dart';

class SideMenuWidget extends HookConsumerWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userStateNotifier = ref.watch(userStateNotifier.notifier);

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
          const SideMenuTile(
            'ダッシュボード',
            iconData: Icons.home,
            pathName: '/',
          ),
          const SideMenuTile(
            'カリキュラム',
            iconData: Icons.calendar_month,
            pathName: '/curriculums',
          ),
          const SideMenuTile('ミッション',
              iconData: Icons.assignment_late_outlined, pathName: '/missions'),
          const SideMenuTile('スキル', iconData: Icons.psychology, pathName: '/'),
          const SideMenuTile('メンバー', iconData: Icons.groups, pathName: '/'),
          const SideMenuTile('アカウント', iconData: Icons.person, pathName: '/accounts'),
          const SideMenuTile('管理者設定',
              iconData: Icons.corporate_fare, pathName: '/'),
          SideMenuTile(
            'ログアウト',
            iconData: Icons.logout,
            function: () async {
              await _userStateNotifier.logout();
              showSnackbar('ログアウトしました', context);
            },
          ),
        ],
      ),
    );
  }
}
