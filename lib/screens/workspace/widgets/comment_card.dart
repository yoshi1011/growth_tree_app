import 'package:flutter/material.dart';
import '../../../models/comment.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/avatar/user_avatar.dart';
import '../../../widgets/text/s_text.dart';
import '../../../widgets/text/xs_text.dart';

class CommentCard extends StatelessWidget {
  // TODO: imageUrlやroleではなくUserを渡せるようにする
  final Comment comment;
  final String imageUrl;
  final Role role;

  const CommentCard(
      {Key? key,
      required this.comment,
      required this.imageUrl,
      required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildList = [
      UserAvatar(
        imageUrl: imageUrl,
        sideLength: 40,
      ),
    ];
    // 送信元に応じてコメントの左右を変更する
    role == Role.employee
        ? _buildList.add(_buildCommentContent())
        : _buildList.insert(0, _buildCommentContent());

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildList,
      ),
    );
  }

  Widget _buildCommentContent() {
    // type promotionを有効にするための対策。
    // https://medium.com/flutter-jp/null-safety-fe6503a81d5c#5a0c
    // すべてのプロパティをローカル変数化したほうがわかりやすいかは検討の余地あり
    final attachmentName = comment.attachmentName;

    return Container(
      width: 480,
      // height: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: const Offset(0, 1),
            color: const Color(0x00000000).withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SText(
            comment.content,
            fontColor: GrowthTreeColors.black,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  attachmentName != null
                      ? Row(
                          children: [
                            const Icon(
                              Icons.insert_drive_file_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            XsText(
                              attachmentName,
                              fontColor: GrowthTreeColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
              Row(
                children: [
                  XsText(
                    comment.datetime,
                    fontColor: GrowthTreeColors.lightGray,
                    fontWeight: FontWeight.normal,
                  ),
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
                          color: GrowthTreeColors.yellow,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      XsText(
                        comment.action,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
