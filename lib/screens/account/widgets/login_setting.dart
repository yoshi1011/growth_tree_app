// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../../models/user.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/form/outlined_text_field.dart';
import '../../../widgets/text/l_text.dart';

class LoginSetting extends HookConsumerWidget {
  const LoginSetting({Key? key, required this.user}) : super(key: key);

  final User? user;

  void _saveLoginSetting(context) {
    showSnackbar('ログイン情報を保存しました', context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useTextEditingController(text: user?.email);
    final _passwordController = useTextEditingController();
    final _passwordConfirmController = useTextEditingController();

    return Container(
      width: 864,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(
            color: GrowthTreeColors.lightGray,
            width: 1,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LText(
            'ログイン情報',
            fontColor: GrowthTreeColors.black,
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 722,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 340,
                        child: OutlinedTextField(
                          controller: _emailController,
                          labelText: 'メールアドレス',
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 340,
                        child: OutlinedTextField(
                          controller: _passwordController,
                          labelText: 'パスワード',
                          textInputType: TextInputType.text,
                          isPass: true,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 340,
                        child: OutlinedTextField(
                          controller: _passwordConfirmController,
                          labelText: 'パスワード(繰り返し)',
                          textInputType: TextInputType.text,
                          isPass: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: BasicButton(
                      labelName: '保存',
                      color: GrowthTreeColors.blue,
                      onPressed: () => _saveLoginSetting(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
