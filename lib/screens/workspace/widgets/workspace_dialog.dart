import 'package:flutter/material.dart';
import 'package:growth_tree_app/utils/colors.dart';
import 'package:growth_tree_app/widgets/button/button.dart';
import 'package:growth_tree_app/widgets/card/file_card.dart';
import 'package:growth_tree_app/widgets/chip/task_status_chip.dart';
import 'package:growth_tree_app/widgets/form/outlined_text_area.dart';
import 'package:growth_tree_app/widgets/icon/task_type_icon.dart';
import 'package:growth_tree_app/widgets/text/l_text.dart';
import 'package:growth_tree_app/widgets/text/s_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorkspaceDialog extends HookConsumerWidget {
  const WorkspaceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 792,
            height: 820,
            padding: const EdgeInsets.fromLTRB(45, 35, 45, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // タスク名の行
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // タスク名
                    Row(
                      children: [
                        TaskTypeIcon.work(),
                        const SizedBox(
                          width: 20,
                        ),
                        LText(
                          'Rubyでサンプルコードを書いてみる',
                          fontColor: GrowthTreeColors.black,
                        ),
                      ],
                    ),
                    // タスクステータス
                    TaskStatusChip.complete(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // タスク名の行以降…
                Container(
                  width: 568,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SText(
                        '遅れて提出',
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Employee記入のメッセージ枠
                      SizedBox(
                        height: 40,
                        child: SText(
                          '提出が遅くなりすみません。再提出です。\nチェリー本を見ながらRubyコードを書きました。採点のほどよろしくお願いいたします。',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // 添付ファイルリスト
                      Row(
                        children: [
                          FileCard(name: 'main.rb'),
                          const SizedBox(
                            width: 20,
                          ),
                          FileCard(name: 'main.rb'),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      OutlinedTextArea(
                        controller: useTextEditingController(),
                        labelText: 'レビューを記載する',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          BasicButton(
                            labelName: '再提出',
                            color: GrowthTreeColors.red,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          BasicButton(
                            labelName: '完了',
                            color: GrowthTreeColors.themeColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
