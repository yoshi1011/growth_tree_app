import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/colors.dart';
import '../widgets/frame/auth_page_frame.dart';
import '../widgets/text/xs_text.dart';

class SentPasswordResetMailScreen extends HookConsumerWidget {
  const SentPasswordResetMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPageFrame(
      title: 'パスワード再設定用メールを送信しました',
      body: Column(
        children: [
          const SizedBox(
            width: 300,
            child: XsText(
              'ご入力いただいたメールアドレス宛にパスワード再設定用のURLを送信いたしました。\n記載の内容に従ってパスワードの再設定を行ってください。',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
//          トップに戻る
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'トップ',
              style:
                  TextStyle(fontSize: 16, color: GrowthTreeColors.themeColor),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                primary: GrowthTreeColors.lightThemeColor),
          ),
        ],
      ),
    );
  }
}
