import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasicButton extends HookConsumerWidget {
  final String labelName;
  final Color color;

  const BasicButton({
    Key? key,
    required this.labelName,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoading = useState(false);

    return ElevatedButton(
      onPressed: () {
        _isLoading.value = true;
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
              style: const TextStyle(fontSize: 16),
            ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          primary: color),
    );
  }
}
