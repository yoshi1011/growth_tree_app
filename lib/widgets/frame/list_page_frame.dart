import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/table_items/table_item.dart';
import '../../utils/colors.dart';
import '../avatar/user_avatar.dart';
import 'base_frame.dart';
import '../text/s_text.dart';
import '../../models/skill.dart';
import '../../models/user.dart';
import '../chip/skill_chip.dart';

class ListPageFrame extends HookConsumerWidget {
  final String title;
  final List<String> columnNames;
  final List<num> columnWidths;
  final List<TableItem> dataList;

  const ListPageFrame(
      {Key? key,
      required this.title,
      required this.columnNames,
      required this.columnWidths,
      required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseFrame(
      title: title,
      contentWidget: Table(
        columnWidths: _setColumnWidths(columnWidths),
        children: <TableRow>[
          // ヘッダー
          _buildHeaderColumns(columnNames),
          // 各データRow
          ..._buildDataRows(dataList)
        ],
      ),
    );
  }

  Map<int, FlexColumnWidth> _setColumnWidths(List<num> columnWidths) {
    // 最右にドットメニューを追加するため一列分を追加
    // NOTE: 一列分追加が見えにくくなっているため、リファクタリングの必要性があるかも
    List<num> addedColumnWidths = [...columnWidths, 1];

    return addedColumnWidths
        .asMap()
        .map((key, value) => MapEntry(key, FlexColumnWidth(value.toDouble())));
  }

  TableRow _buildHeaderColumns(List<String> columnNames) {
    // 最右にドットメニューを追加するため一列分を追加
    // NOTE: 一列分追加が見えにくくなっているため、リファクタリングの必要性があるかも
    List<String> addedColumnNames = [...columnNames, ''];

    final headerColumns = addedColumnNames.map((columnName) {
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

  List<TableRow> _buildDataRows(List<TableItem> dataList) {
    final dataRows = dataList.map((data) {
      return _buildDataColumns(data);
    }).toList();

    return dataRows;
  }

  TableRow _buildDataColumns(TableItem item) {
    final listItem = [
      ...item.toList(),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: GrowthTreeColors.darkGray,
        ),
      ),
    ];

    final dataColumns = listItem.map(
      (data) {
        late final child;

        // データの型に応じてWidgetを変更する
        if (data is String || data is int) {
          child = SText(
            data.toString(),
            fontColor: GrowthTreeColors.darkGray,
            fontWeight: FontWeight.normal,
          );
        } else if (data is Set<User>) {
          // UserのimageUrlからUserAvatarのリストを作成する
          final avatarList = data
              .map((d) => UserAvatar(imageUrl: d.imageUrl ?? 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80'))
              .toList();

          // 作成したAvatarからAvatarStackを作成する
          child = UserAvatarList(avatarList: avatarList);
        } else if (data is Set<Skill>) {
          // Containerの子Widgetにするため、Rowでラップする
          child = Row(
            children: data
                .map((d) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SkillChip(
                        name: d.name,
                        themeColor: d.themeColor,
                      ),
                    ))
                .toList(),
          );
        } else {
          child = data;
        }
        print(child);
        return Container(height: 40, alignment: Alignment.center, child: child);
      },
    ).toList();

    return TableRow(
      children: dataColumns,
    );
  }
}
