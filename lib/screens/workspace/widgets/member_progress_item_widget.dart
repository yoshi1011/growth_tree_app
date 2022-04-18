import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/chip/unread_chip.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';

class MemberProgressItemWidget extends StatelessWidget {
  const MemberProgressItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 530,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
        child: Row(
          children: [
            // item type icon
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.check_box),
              ),
            ),
            // item name
            Expanded(
              flex: 10,
              child: Container(
                child: SText(
                  'Rubyでサンプルコードを書いてみる',
                  fontColor: GrowthTreeColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // item date
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: XsText(
                  '2022年4月1日',
                  fontColor: GrowthTreeColors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // item status
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: UnreadChip(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
