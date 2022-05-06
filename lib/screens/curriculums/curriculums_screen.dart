import 'package:flutter/material.dart';

import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import '../../models/skill.dart';
import '../../models/table_items/curriculum_item.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';
import '../../widgets/frame/list_page_frame.dart';

class CurriculumsScreen extends StatelessWidget {
  const CurriculumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: ListPageFrame(
        title: 'カリキュラム',
        // NOTE: columnNamesおよびcolumnWidthsは定数で定義したほうがわかりやすそう
        columnNames: CurriculumColumnNames,
        columnWidths: CurriculumColumnWidths,
        dataList: items,
      ),
    );
  }
}

// test data
final testUser = User(
  email: "admin@example.com",
  firstName: "山田",
  lastName: "太郎",
  birthday: DateTime(2022, 4, 1),
  role: Role.employee,
  accessToken: 'aaa',
  imageUrl:
      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
);
final item = CurriculumItem('よくわかるRuby', 15, [testUser, testUser, testUser],
    [Skill(name: 'Ruby', themeColor: Colors.red), Skill(name: 'JavaScript', themeColor: Colors.yellow)]);

final items = [item, item, item];
