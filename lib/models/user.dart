import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/constants.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? accessToken,
    required String email,
    required String firstName,
    required String lastName,
    required DateTime birthday,
    required Role role,
    DateTime? joinedDate,
    String? imageUrl
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
