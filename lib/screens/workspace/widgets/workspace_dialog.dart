import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../widgets/avatar/user_avatar.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/card/file_card.dart';
import '../../../widgets/chip/task_status_chip.dart';
import '../../../widgets/form/outlined_text_area.dart';
import '../../../widgets/icon/task_type_icon.dart';
import '../../../widgets/text/l_text.dart';
import '../../../widgets/text/s_text.dart';
import '../../../widgets/text/xs_text.dart';

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
                      const SizedBox(
                        height: 20,
                      ),
                      const LText(
                        'Activity',
                        fontColor: GrowthTreeColors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserAvatar(
                            imageUrl:
                                'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
                          ),
                          Container(
                            width: 480,
                            height: 90,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                  color:
                                      const Color(0x00000000).withOpacity(0.25),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SText(
                                  'チェリー本を見ながらRubyコードを書きました。採点のほどよろしくお願いいたします。',
                                  fontColor: GrowthTreeColors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.insert_drive_file_outlined,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          XsText(
                                            'main.rb',
                                            fontColor: GrowthTreeColors.black,
                                            fontWeight: FontWeight.normal,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          XsText('2022年4月1日'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Stack(
                                            alignment: const Alignment(0, 0),
                                            children: [
                                              Container(
                                                width: 48,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color:
                                                      GrowthTreeColors.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              XsText(
                                                '提出',
                                                fontColor: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
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
