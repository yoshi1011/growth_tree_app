// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasicButton extends HookConsumerWidget {
  final String labelName;
  final Color color;
  final Function? onPressed;

  const BasicButton({
    Key? key,
    required this.labelName,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  // callbackで取得したVoidCallbackの前後にローディング処理を置くためメソッド定義
  // 記述方法がかなり奇妙なので修正する必要あり
  void onPressedFunction (_isLoading) {
    _isLoading.value = true;
    onPressed?.call();
    _isLoading.value = false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoading = useState(false);

    return ElevatedButton(
      onPressed: () {
        onPressedFunction(_isLoading);
      },
      child: _isLoading.value
          ? const SizedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
              width: 16,
              height: 16,
            )
          : Text(
              labelName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        primary: color,
      ),
    );
  }
}
