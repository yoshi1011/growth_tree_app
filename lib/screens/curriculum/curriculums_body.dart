import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/constants.dart';
import 'package:growth_tree_app/widgets/frame/list_page_frame.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/skill.dart';
import '../../models/table_items/curriculum_item.dart';
import '../../models/user.dart';

class CurriculumsBody extends HookConsumerWidget {
  const CurriculumsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListPageFrame(
      title: 'カリキュラム',
      // NOTE: columnNamesおよびcolumnWidthsは定数で定義したほうがわかりやすそう
      columnNames: CurriculumColumnNames,
      columnWidths: CurriculumColumnWidths,
      dataList: items,
    );
  }
}

// test data
final testUser = User(accessToken: 'aaa', imageUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80');
final item = CurriculumItem(
  'よくわかるRuby',
  15,
  [testUser, testUser, testUser],
  [Skill('Ruby', Colors.red), Skill('JavaScript', Colors.yellow)]
);

final items = [item, item, item];
