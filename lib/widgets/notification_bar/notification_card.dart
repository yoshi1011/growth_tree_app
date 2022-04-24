import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../text/s_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      required this.user,
      required this.message,
      required this.notificationDate})
      : super(key: key);

  // user
  // {'name': XXX, 'imageUrl': XXX}
  // を想定している
  final Map<String, String> user;

  // NOTE: messageは仕様変更の可能性あり
  // 現時点では完了通知のみをデザインしているが
  // 通知内容の拡張によって設計の変更可能性あり
  final String message;
  final DateTime notificationDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        width: 260,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        user['imageUrl'] as String,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SText(user['name'] as String),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SText(message),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                DateFormat('yyyy年MM月dd日').format(notificationDate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
