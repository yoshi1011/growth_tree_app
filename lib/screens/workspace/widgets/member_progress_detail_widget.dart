import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/avatar/user_avatar.dart';
import '../../../widgets/progress_bar/progress_bar.dart';
import '../../../widgets/text/l_text.dart';
import '../../../widgets/text/m_text.dart';
import '../../../widgets/text/s_text.dart';
import '../../../widgets/text/title_text.dart';
import 'member_progress_item_widget.dart';

class MemberProgressDetailWidget extends StatelessWidget {
  const MemberProgressDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 575,
      height: 800,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 18,
      ),
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
          // User情報
          Row(
            children: [
              UserAvatar(
                  imageUrl:
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80'),
              const SizedBox(
                width: 16,
              ),
              LText(
                '山田太郎',
                fontColor: GrowthTreeColors.black,
              )
            ],
          ),
          // 取組中のカリキュラムなど
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 取組中のカリキュラム名
                LText(
                  'Ruby on RailsでWebサービスを開発できるようになる',
                  fontColor: GrowthTreeColors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                // カリキュラムの期間
                Container(
                  alignment: Alignment.topRight,
                  child: SText(
                    '2022年4月1日〜2022年10月31日',
                    fontColor: GrowthTreeColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // 取組中のミッション
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.directions_run,
                        color: GrowthTreeColors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MText(
                        'チェリー本を読み終える',
                        fontColor: GrowthTreeColors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProgressBar(
                      progressRate: 0.5,
                      width: 400,
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: TitleText('50%'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 新着・要チェックコンテナ
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SText(
                      '新着・要チェック',
                      fontColor: GrowthTreeColors.themeColor,
                      fontWeight: FontWeight.normal,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const SText(
                        'すべて既読にする',
                        fontColor: GrowthTreeColors.themeColor,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 60 * 3,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: MemberProgressItemWidget(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // 既読コンテナ
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const SText(
                    '既読',
                    fontColor: GrowthTreeColors.themeColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  height: 60 * 3,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: MemberProgressItemWidget(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
