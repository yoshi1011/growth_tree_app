// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/user.dart';
import '../../providers/user_state_provider.dart';
import '../../widgets/frame/base_frame.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import 'widgets/login_setting.dart';
import 'widgets/profile_setting.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? _user = ref.watch(userStateProvider.notifier).user;
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: SingleChildScrollView(
        child: BaseFrame(
          title: 'アカウント',
          contentWidget: Column(
            children: [
              LoginSetting(user: _user,),
              const SizedBox(height: 45,),
              ProfileSetting(),
            ],
          ),
        ),
      ),
    );
  }
}
