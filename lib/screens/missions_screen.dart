import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/header/header_widget.dart';
import 'package:growth_tree_app/widgets/notification_bar/notification_bar_widget.dart';
import 'package:growth_tree_app/widgets/side_menu/side_menu_widget.dart';

import '../models/skill.dart';
import '../models/table_items/mission_item.dart';
import '../utils/constants.dart';
import '../widgets/frame/list_page_frame.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: ListPageFrame(
        title: 'ミッション',
        columnNames: MissionColumnNames,
        columnWidths: MissionColumnWidths,
        dataList: items,
      ),
    );
  }
}

// test data
final item = MissionItem(
    'チェリー本を読み終える',
    15,
    10,
    [Skill('Ruby', Colors.red), Skill('JavaScript', Colors.yellow)]
);

final items = [item, item, item];
