import 'package:flutter/material.dart';
import 'package:growth_tree_app/models/table_items/curriculum_item.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/avatar/active_user_avatar.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:growth_tree_app/widgets/text/title_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/skill.dart';
import '../../models/user.dart';
import '../chip/skill_chip.dart';

class ListPageFrame extends HookConsumerWidget {
  final String title;
  final List<String> columnNames;
  final List<num> columnWidths;
  final List<CurriculumItem> dataList;

  const ListPageFrame(
      {Key? key,
      required this.title,
      required this.columnNames,
      required this.columnWidths,
      required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: 864,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: TitleText(title),
            ),
            SizedBox(
              height: 40,
            ),
            Table(
              columnWidths: _setColumnWidths(columnWidths),
              children: <TableRow>[
                _buildHeaderColumns(
                  columnNames,
                ),
                ..._buildDataRows(dataList)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<int, FlexColumnWidth> _setColumnWidths(List<num> columnWidths) {
    return columnWidths
        .asMap()
        .map((key, value) => MapEntry(key, FlexColumnWidth(value.toDouble())));
  }

  TableRow _buildHeaderColumns(List<String> columnNames) {
    final headerColumns = columnNames.map((columnName) {
      return Container(
        height: 30,
        alignment: Alignment.center,
        color: GrowthTreeColors.lightThemeColor,
        child: SText(
          columnName,
          fontColor: GrowthTreeColors.themeColor,
          fontWeight: FontWeight.normal,
        ),
      );
    }).toList();

    return TableRow(
      decoration: BoxDecoration(
          color: GrowthTreeColors.lightThemeColor,
          borderRadius: BorderRadius.circular(5)),
      children: headerColumns,
    );
  }

  List<TableRow> _buildDataRows(List<CurriculumItem> dataList) {
    final dataRows = dataList.map((data) {
      return _buildDataColumns(data);
    }).toList();

    return dataRows;
  }

  TableRow _buildDataColumns(CurriculumItem item) {
    final dataColumns = item.toList().map((data) {
      late final child;

      // データの型に応じてWidgetを変更する
      if (data is String || data is int) {
        child = SText(
          data.toString(),
          fontColor: GrowthTreeColors.darkGray,
          fontWeight: FontWeight.normal,
        );
      } else if (data is List<User>) {
        // UserのimageUrlからActiveUserAvatarのリストを作成する
        final avatarList = data.map((d) => ActiveUserAvatar(imageUrl: d.imageUrl as String)).toList();

        // 作成したAvatarからAvatarStackを作成する
        child = ActiveUserAvatarList(avatarList: avatarList);
      } else if (data is List<Skill>) {
        // Containerの子Widgetにするため、Rowでラップする
        child = Row(
          children: data.map((d) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SkillChip(
                    name: d.name,
                    themeColor: d.themeColor,
                  ),
                )).toList(),
        );
      }

      return Container(
        height: 40,
        alignment: Alignment.center,
        child: child
      );
    }).toList();

    return TableRow(
      children: dataColumns,
    );
  }
}