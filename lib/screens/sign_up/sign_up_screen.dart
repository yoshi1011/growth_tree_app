import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/user_provider.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../validators/date_validator.dart';
import '../../view_models/sign_up_view_model.dart';
import '../../widgets/form/google_login_button.dart';
import '../../widgets/form/outlined_text_field.dart';
import '../../widgets/frame/auth_page_frame.dart';
import '../../widgets/text/l_text.dart';
import '../../widgets/text/xs_text.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _birthdayController = TextEditingController();

    final _companyNameController = TextEditingController();
    final _zipCodeController = TextEditingController();
    final _prefectureController = TextEditingController();
    final _cityController = TextEditingController();
    final _addressLine1Controller = TextEditingController();
    final _addressLine2Controller = TextEditingController();

    final _isLoading = useState(false);

    final _signUpViewModel = ref.read(signUpViewModelProvider.notifier);
    final _userStateNotifier = ref.watch(userStateNotifier.notifier);

    final _formKey = useMemoized(() => GlobalKey<FormState>());

    return AuthPageFrame(
      title: '新規登録',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Google Login Button
            GoogleLoginButton(
              isSignUp: true,
            ),
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
            const LText('管理者情報'),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _emailController,
                labelText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _firstNameController,
                labelText: 'First Name',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _lastNameController,
                labelText: 'Last Name',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _birthdayController,
                labelText: 'yyyy-mm-dd',
                textInputType: TextInputType.text,
                validator: DateValidator.validate,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const LText('企業情報'),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _companyNameController,
                labelText: 'Company Name',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _zipCodeController,
                labelText: 'Zip Code',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _prefectureController,
                labelText: 'Prefecture Name',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _cityController,
                labelText: 'City Name',
                textInputType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _addressLine1Controller,
                labelText: 'Address Line 1',
                textInputType: TextInputType.streetAddress,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: OutlinedTextField(
                controller: _addressLine2Controller,
                labelText: 'Address Line 2',
                textInputType: TextInputType.streetAddress,
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _isLoading.value = true;
                  await _signUpViewModel.signUp(
                    _emailController.text,
                    _passwordController.text,
                    _firstNameController.text,
                    _lastNameController.text,
                    _birthdayController.text,
                    _companyNameController.text,
                    _zipCodeController.text,
                    _prefectureController.text,
                    _cityController.text,
                    _addressLine1Controller.text,
                    _addressLine2Controller.text,
                  );
                  _isLoading.value = false;
                  if (_userStateNotifier.isLoggedIn() == true) {
                    context.go('/sent_register_mail');
                  } else {
                    showSnackbar('記入事項に漏れがないか確認してください', context);
                  }
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
      ),
    );
  }
}
