import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double sideLength;

  const UserAvatar({Key? key, required this.imageUrl, this.sideLength = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sideLength,
      height: sideLength,
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class UserAvatarList extends StatelessWidget {
  final List<UserAvatar> avatarList;

  const UserAvatarList({Key? key, required this.avatarList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatars = avatarList.asMap().entries.map((entry) {
      int index = entry.key;
      UserAvatar avatar = entry.value;
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
