// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../../models/comment.dart';
import '../../../models/user.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/card/file_card.dart';
import '../../../widgets/chip/task_status_chip.dart';
import '../../../widgets/form/outlined_text_area.dart';
import '../../../widgets/icon/task_type_icon.dart';
import '../../../widgets/text/l_text.dart';
import '../../../widgets/text/s_text.dart';
import 'comment_card.dart';

class WorkspaceDialog extends HookConsumerWidget {
  const WorkspaceDialog({Key? key}) : super(key: key);

  void _sendCompletedMessage(context) {
    showSnackbar('完了メッセージを送信しました。', context);
  }

  void _sendResubmitMessage(context) {
    showSnackbar('再提出メッセージを送信しました。', context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 45,
            child: TaskTypeIcon.work(),
          ),
          Container(
            alignment: Alignment.center,
            width: 792,
            height: 820,
            padding: const EdgeInsets.fromLTRB(45, 35, 45, 20),
            child: Container(
              width: 568,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // タスク名の行
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // タスク名
                      LText(
                        'Rubyでサンプルコードを書いてみる',
                        fontColor: GrowthTreeColors.black,
                      ),
                      // タスクステータス
                      TaskStatusChip.complete(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SText(
                    '遅れて提出',
                    fontColor: GrowthTreeColors.lightGray,
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
                      AttachmentCard(name: 'main.rb'),
                      const SizedBox(
                        width: 20,
                      ),
                      AttachmentCard(name: 'main.rb'),
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
                    children: [
                      BasicButton(
                        labelName: '再提出',
                        color: GrowthTreeColors.red,
                        onPressed: () => _sendResubmitMessage(context),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      BasicButton(
                        labelName: '完了',
                        color: GrowthTreeColors.themeColor,
                        onPressed: () => _sendCompletedMessage(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const LText(
                    'Activity',
                    fontColor: GrowthTreeColors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Activityコメント
                  Container(
                    width: 570,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                          color: const Color(0x00000000).withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        final role =
                            index % 2 == 0 ? Role.employee : Role.manager;
                        return CommentCard(
                          comment: comments[index],
                          imageUrl:
                              'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
                          role: role,
                        );
                      },
                    ),
                  )
                ],
              ),
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

// test data

final testUser = User(
  id: 1,
  email: "admin@example.com",
  firstName: "山田",
  lastName: "太郎",
  birthday: DateTime(2022, 4, 1),
  role: Role.employee,
  accessToken: 'aaa',
  imageUrl:
  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
);

final comment = Comment(
  content: 'チェリー本を見ながらRubyコードを書きました。採点のほどよろしくお願いいたします。',
  contributor: testUser,
  attachments: {},
  createdAt: DateTime(2022, 4, 1),
  action: '提出',
);
final comment2 = Comment(
  content: 'やりなおしてください',
  contributor: testUser,
  attachments: {},
  createdAt: DateTime(2022, 4, 1),
  action: '再提出',
);

final comments = [comment, comment2, comment, comment2, comment2, comment];
