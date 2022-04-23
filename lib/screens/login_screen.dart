import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/form/google_login_button.dart';
import '../widgets/form/outlined_text_field.dart';
import '../widgets/frame/auth_page_frame.dart';
import '../widgets/text/xs_text.dart';
import '../api/auth.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _isLoading = useState(false);

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
                  color: const Color(0xfffafafa),
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
                controller: _emailController,
                labelText: 'Email',
                textInputType: TextInputType.emailAddress),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: OutlinedTextField(
              controller: _passwordController,
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
                  onTap: () => context.go('/forgot_password'),
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
            onPressed: () async {
              _isLoading.value = true;
              String res = await Auth.login(
                  ref, _emailController.text, _passwordController.text);
              _isLoading.value = false;
              showSnackbar('ログインしました', context);
              if (res != 'success') {
                showSnackbar('ログインができませんでした', context);
              }
            },
            child: _isLoading.value
                ? const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    width: 16,
                    height: 16,
                  )
                : const Text(
                    'ログイン',
                    style: TextStyle(fontSize: 16),
                  ),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                onTap: () => context.go('/sign_up'),
                child: const Text(
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
