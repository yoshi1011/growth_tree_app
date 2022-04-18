import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/frame/base_frame.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/card/member_progress_card.dart';
import '../widgets/header/header_widget.dart';
import '../widgets/notification_bar/notification_bar_widget.dart';
import '../widgets/side_menu/side_menu_widget.dart';

class WorkspaceScreen extends ConsumerWidget {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: SideMenuWidget(),
      endDrawer: NotificationBarWidget(),
      body: BaseFrame(
        title: 'ワークスペース',
        contentWidget: SingleChildScrollView(
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 275,
                  height: 600,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: GrowthTreeColors.lightThemeColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        color: const Color(0x00000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: const SText(
                          'メンバー',
                          fontColor: GrowthTreeColors.themeColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: MemberProgressCard(
                                userName: '山田太郎',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
                                curriculumTitle:
                                    'Ruby on RailsでWebサービスを開発できるようになる',
                                curriculumPeriod: '2022年4月1日〜2022年10月31日',
                                missionTitle: 'チェリー本を読み終える',
                                missionStatus: 'complete',
                                progressRate: 0.1 * index,
                                unread: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Container(
                  width: 575,
                  height: 600,
                  decoration: BoxDecoration(
                    color: GrowthTreeColors.lightThemeColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        color: const Color(0x00000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
