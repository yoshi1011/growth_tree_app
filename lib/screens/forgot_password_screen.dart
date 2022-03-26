import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/form/google_login_button.dart';
import 'package:growth_tree_app/widgets/form/outlined_text_field.dart';
import 'package:growth_tree_app/widgets/frame/auth_page_frame.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth_tree_app/utils/colors.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();

    return AuthPageFrame(
      title: 'パスワードを忘れた場合',
      body: Column(
        children: [
          const SizedBox(
            width: 300,
            child: XsText(
              '登録しているメールアドレスを入力してください。\nメールアドレス宛にパスワード変更ページのURLが記載されたメールを送信します。',
            ),
          ),
          const SizedBox(height: 15,),
          // Form
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
                controller: emailController,
                labelText: 'Email',
                textInputType: TextInputType.emailAddress),
          ),
          const SizedBox(
            height: 15,
          ),
//          送信ボタン
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              '送信',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                primary: GrowthTreeColors.themeColor),
          ),
        ],
      ),
    );
  }
}
