import 'package:flutter/material.dart';
import 'package:growth_tree_app/widgets/form/google_login_button.dart';
import 'package:growth_tree_app/widgets/form/outlined_text_field.dart';
import 'package:growth_tree_app/widgets/frame/auth_page_frame.dart';
import 'package:growth_tree_app/widgets/text/xs_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth_tree_app/utils/colors.dart';
import '../providers/user_provider.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    int res = await ref
        .read(userProvider.notifier)
        .login(emailController.text, passwordController.text);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageFrame(
      title: 'ログイン',
      body: Column(
        children: [
          // Google Login Button
          GoogleLoginButton(),
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
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: null,
                      fillColor: MaterialStateProperty.all(
                          GrowthTreeColors.themeColor),
                    ),
                    const XsText(
                      'ログインしたままにする',
                      fontColor: GrowthTreeColors.themeColor,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'パスワードを忘れた場合',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // 続けるボタン
          ElevatedButton(
            onPressed: () => loginUser(),
            child: const Text(
              'ログイン',
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
              const XsText('アカウントを持っていない場合'),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'アカウントを作成',
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
