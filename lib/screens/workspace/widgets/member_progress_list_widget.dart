import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';

import 'member_progress_card.dart';

class MemberProgressListWidget extends StatelessWidget {
  const MemberProgressListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 800,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: GrowthTreeColors.highLightThemeColor,
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
                    curriculumTitle: 'Ruby on RailsでWebサービスを開発できるようになる',
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
    );
  }
}
