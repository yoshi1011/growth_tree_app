import 'package:flutter/material.dart';
import 'package:growth_tree_app/screens/workspace/widgets/member_progress_detail_widget.dart';
import 'package:growth_tree_app/screens/workspace/widgets/member_progress_list_widget.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/avatar/user_avatar.dart';
import 'package:growth_tree_app/widgets/frame/base_frame.dart';
import 'package:growth_tree_app/widgets/progress_bar/progress_bar.dart';
import 'package:growth_tree_app/widgets/text/l_text.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:growth_tree_app/widgets/text/title_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './widgets/member_progress_card.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import '../../widgets/text/m_text.dart';

class WorkspaceScreen extends ConsumerWidget {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: SingleChildScrollView(
        child: BaseFrame(
          title: 'ワークスペース',
          contentWidget: Row(
            children: [
              MemberProgressListWidget(),
              const SizedBox(
                width: 14,
              ),
              MemberProgressDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
