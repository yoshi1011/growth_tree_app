import 'package:flutter/material.dart';

class ActiveUserAvatar extends StatelessWidget {
  final String imageUrl;

  const ActiveUserAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class ActiveUserAvatarList extends StatelessWidget {
  final List<ActiveUserAvatar> avatarList;

  const ActiveUserAvatarList({Key? key, required this.avatarList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatars = avatarList.asMap().entries.map((entry) {
      int index = entry.key;
      ActiveUserAvatar avatar = entry.value;
      return Positioned(
        top: 0,
        // インデックス値に15をかけた数値分右から位置をずらしていく
        right: index * 15,
        child: avatar,
      );
    }).toList();

    return Stack(
      alignment: Alignment.center,
      children: avatars,
    );
  }
}
