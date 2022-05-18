// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../models/skill.dart';
import '../../models/table_items/member_item.dart';
import '../../models/table_items/mission_item.dart';
import '../../models/table_items/table_item.dart';
import '../../models/user.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/avatar/user_avatar.dart';
import '../../widgets/chip/skill_chip.dart';
import '../../widgets/frame/base_frame.dart';
import '../../widgets/header/header_widget.dart';
import '../../widgets/notification_bar/notification_bar_widget.dart';
import '../../widgets/side_menu/side_menu_widget.dart';
import '../../widgets/text/l_text.dart';
import '../../widgets/text/s_text.dart';

class CurriculumDetailScreen extends StatefulWidget {
  const CurriculumDetailScreen({Key? key}) : super(key: key);

  @override
  State<CurriculumDetailScreen> createState() => _CurriculumDetailScreenState();
}

class _CurriculumDetailScreenState extends State<CurriculumDetailScreen> {
  List<Widget> tabs = [
    Tab(text: 'ミッション'),
    Tab(text: 'メンバー'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: BaseFrame(
        title: 'Ruby on RailsでWebサービスを開発できるようになる',
        contentWidget: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LText(
                '対象スキル',
                fontColor: GrowthTreeColors.black,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SkillChip(
                    name: 'Ruby',
                    themeColor: GrowthTreeColors.red,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SkillChip(
                    name: 'Ruby on Rails',
                    themeColor: GrowthTreeColors.red,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SkillChip(
                    name: 'JavaScript',
                    themeColor: Colors.yellow,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              DefaultTabController(
                length: tabs.length,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      child: TabBar(
                        labelColor: GrowthTreeColors.themeColor,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: GrowthTreeColors.themeColor, width: 5),
                        ),
                        tabs: tabs,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      // 仮実装
                      height: 400,
                      child: TabBarView(
                        children: [
                          Table(
                            columnWidths: _setColumnWidths(MissionColumnWidths),
                            children: <TableRow>[
                              _buildHeaderColumns(
                                MissionColumnNames,
                              ),
                              ..._buildDataRows(missionItems)
                            ],
                          ),
                          Table(
                            columnWidths: _setColumnWidths(MemberColumnWidths),
                            children: <TableRow>[
                              _buildHeaderColumns(
                                MemberColumnNames,
                              ),
                              ..._buildDataRows(memberItems)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '追加する',
        backgroundColor: GrowthTreeColors.themeColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  // TODO: テーブルビルダー関連の処理は別Widgetに切り分ける
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

    final dataColumns = listItem.map((data) {
      late final child;

      // データの型に応じてWidgetを変更する
      if (data is String || data is int) {
        child = SText(
          data.toString(),
          fontColor: GrowthTreeColors.darkGray,
          fontWeight: FontWeight.normal,
        );
      } else if (data is List<User>) {
        // UserのimageUrlからUserAvatarのリストを作成する
        final avatarList = data
            .map((d) => UserAvatar(imageUrl: d.imageUrl as String))
            .toList();

        // 作成したAvatarからAvatarStackを作成する
        child = UserAvatarList(avatarList: avatarList);
      } else if (data is List<Skill>) {
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

      return Container(height: 40, alignment: Alignment.center, child: child);
    }).toList();

    return TableRow(
      children: dataColumns,
    );
  }
}

// member test data
final item = MemberItem('山田太郎', 'チェリー本を読み終える', '2022年4月1日');

final memberItems = [item, item, item, item, item];

// test data
final missionItem = MissionItem('チェリー本を読み終える', 15, 10,
    {});

final missionItems = [
  missionItem,
  missionItem,
  missionItem,
  missionItem,
  missionItem
];
