import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../widgets/avatar/user_avatar.dart';
import '../../../widgets/chip/unread_chip.dart';
import '../../../widgets/progress_bar/progress_bar.dart';
import '../../../widgets/text/m_text.dart';
import '../../../widgets/text/s_text.dart';
import '../../../widgets/text/xs_text.dart';

class MemberProgressCard extends StatelessWidget {
  // モデルを実装するまでの仮実装
  final String userName;
  final String imageUrl;
  final String curriculumTitle;
  final String curriculumPeriod;
  final String missionTitle;
  final String missionStatus;
  final double progressRate;
  final bool unread;

  const MemberProgressCard(
      {Key? key,
      required this.userName,
      required this.imageUrl,
      required this.curriculumTitle,
      required this.curriculumPeriod,
      required this.missionTitle,
      required this.missionStatus,
      required this.progressRate,
      required this.unread})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: InkWellのEffectが機能しない問題を解決する
    return InkWell(
      onTap: () {},
      child: Container(
        width: 270,
        height: 160,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 2),
              color: const Color(0x00000000).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserAvatar(
                      imageUrl: imageUrl,
                      sideLength: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SText(
                      userName,
                      fontColor: GrowthTreeColors.black,
                    ),
                  ],
                ),
                unread ? const UnreadChip() : const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            // ミッションについて
            SText(
              missionTitle,
              fontColor: GrowthTreeColors.black,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 7,
            ),
            // カリキュラム名
            XsText(
              curriculumTitle,
              fontColor: GrowthTreeColors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            // カリキュラムの取組期間
            XsText(
              curriculumPeriod,
              fontColor: GrowthTreeColors.black,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 5,
            ),
            // 進捗度
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressBar(progressRate: progressRate),
                MText(
                  NumberFormat.percentPattern("ja").format(progressRate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
