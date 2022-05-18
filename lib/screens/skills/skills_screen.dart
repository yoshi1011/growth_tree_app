// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/table_items/skill_item.dart';
import '../../providers/loading_state_provider.dart';
import '../../utils/constants.dart';
import '../../view_models/skill_list_view_model.dart';
import '../../widgets/frame/list_page_frame.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';

class SkillsScreen extends HookConsumerWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _skillListProvider = ref.read(skillListProvider.notifier);
    final _skillList = ref.watch(skillListProvider.notifier).skills;

    final snapshot = useFuture(
      useMemoized(() {
          return ref
              .read(loadingStateProvider.notifier)
              .whileLoading(_skillListProvider.list);
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
            var result = _skillList != null ?
            _skillList.when(success: (data) {
              if (data.isNotEmpty) {
                List<SkillItem> skillItems = data.map((skill) => SkillItem.fromSkill(skill)).toList();
                return ListPageFrame(
                  title: 'スキル',
                  columnNames: SkillColumnNames,
                  columnWidths: SkillColumnWidths,
                  dataList: skillItems,
                );
              }
            }, error: (error) {
              return const Text('data error');
            }) : const SizedBox();
            return result;
          case ConnectionState.none:
            // TODO: Handle this case.
            break;
          case ConnectionState.active:
            // TODO: Handle this case.
            break;
        }
      })(),
    );
  }
}
