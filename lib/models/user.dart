import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// ログイン認証を実装するための仮設計
@freezed
class User with _$User {
  factory User({String? accessToken, String? imageUrl}) = _User;

  User._();

  late final bool isLoggedIn = accessToken != null;
}
