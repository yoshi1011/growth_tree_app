import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/form/google_login_button.dart';
import 'package:growth_tree_app/widgets/form/outlined_text_field.dart';
import 'package:growth_tree_app/widgets/frame/auth_page_frame.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth_tree_app/utils/colors.dart';

class SentRegisterMailScreen extends HookConsumerWidget {
  const SentRegisterMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthPageFrame(
      title: '初回登録用メールを送信しました',
      body: Column(
        children: [
          const SizedBox(
            width: 300,
            child: XsText(
              'ご入力いただいたメールアドレス宛に初回登録用のURLを送信いたしました。\n記載の内容に従って初回登録を行ってください。',
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
              style: TextStyle(fontSize: 16, color: GrowthTreeColors.themeColor),
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
