import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growth_tree_app/widgets/form/google_login_button.dart';
import 'package:growth_tree_app/widgets/form/outlined_text_field.dart';
import 'package:growth_tree_app/widgets/frame/auth_page_frame.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth_tree_app/utils/colors.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return AuthPageFrame(
      title: '新規登録',
      body: Column(
        children: [
          // Google Login Button
          GoogleLoginButton(isSignUp: true,),
          const SizedBox(
            height: 40,
          ),
          // Google Loginと通常入力とのセパレーター
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Divider(
                height: 1,
                thickness: 1,
                color: GrowthTreeColors.darkGray,
              ),
              Container(
                  width: 60,
                  height: 20,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: const XsText('または'))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Form
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
                controller: firstNameController,
                labelText: 'First Name',
                textInputType: TextInputType.text),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
                controller: lastNameController,
                labelText: 'Last Name',
                textInputType: TextInputType.text),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
                controller: emailController,
                labelText: 'Email',
                textInputType: TextInputType.emailAddress),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
              controller: passwordController,
              labelText: 'Password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 300,
            child: XsText(
              'アカウントを作成することにより、利用規約およびプライバシーポリシーを読み、これに同意するものとします。',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // 続けるボタン
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              '続ける',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                primary: GrowthTreeColors.themeColor),
          ),
          const SizedBox(
            height: 40,
          ),
          // ログイン
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const XsText('アカウントをお持ちの場合'),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => context.go('/login'),
                child: Text(
                  'ログイン',
                  style: TextStyle(
                      color: GrowthTreeColors.themeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
