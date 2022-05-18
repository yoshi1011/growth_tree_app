// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../view_models/curriculum_list_view_model.dart';
import '../../widgets/frame/base_frame.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import 'widgets/member_progress_detail_widget.dart';
import 'widgets/member_progress_list_widget.dart';

class WorkspaceScreen extends ConsumerWidget {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _api = ref.read(curriculumListProvider.notifier);
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
