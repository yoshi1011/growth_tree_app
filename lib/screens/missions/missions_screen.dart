// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/table_items/mission_item.dart';
import '../../providers/loading_state_provider.dart';
import '../../utils/constants.dart';
import '../../view_models/mission_list_view_model.dart';
import '../../widgets/frame/list_page_frame.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';

class MissionsScreen extends HookConsumerWidget {
  const MissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _missionListProvider = ref.read(missionListProvider.notifier);
    final _missionList = ref.watch(missionListProvider.notifier).missions;

    final snapshot = useFuture(
        useMemoized(() {
          return ref.read(loadingStateProvider.notifier)
              .whileLoading(_missionListProvider.list);
        },
        ),
    );

    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: (() {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            var result = _missionList != null ?
                _missionList.when(success: (data) {
                  if (data.isNotEmpty) {
                    List<MissionItem> missionItems = data.map((mission) => MissionItem.fromMission(mission)).toList();
                    return ListPageFrame(
                      title: 'ミッション',
                      columnNames: MissionColumnNames,
                      columnWidths: MissionColumnWidths,
                      dataList: missionItems,
                    );
                  }
                }, error: (error) {
                  return const Text('data error');
                }) : const SizedBox();
            return result;
        }
      })(),
    );
  }
}
