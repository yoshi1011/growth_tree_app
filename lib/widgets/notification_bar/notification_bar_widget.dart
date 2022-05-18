// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../utils/colors.dart';
import '../text/s_text.dart';
import '../text/title_text.dart';
import 'notification_card.dart';

class NotificationBarWidget extends StatefulHookConsumerWidget {
  const NotificationBarWidget({Key? key}) : super(key: key);

  @override
  NotificationBarWidgetState createState() => NotificationBarWidgetState();
}

class NotificationBarWidgetState extends ConsumerState<NotificationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 100,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const TitleText('通知'),
          SizedBox(
            height: 35,
          ),
          InkWell(
            child: const SText(
              'すべて既読にする',
              fontColor: GrowthTreeColors.themeColor,
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                var imageIndex = index % 3 + 1;
                var user = {
                  'name': '山田太郎',
                  'imageUrl': 'assets/sample_images/user$imageIndex.jpeg'
                };
                return NotificationCard(
                  user: user,
                  message: 'ミッションXXXを完了しました',
                  notificationDate: DateTime(2022, 4, 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
