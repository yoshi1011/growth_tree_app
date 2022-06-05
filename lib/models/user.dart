// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../utils/constants.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required num id,
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

  String get birthdayText =>
      '${birthday.year}-${birthday.month.toString().padLeft(2, "0")}-${birthday.day.toString().padLeft(2, "0")}';

  String? get joinedDateText {
    if (joinedDate != null) {
      return '${joinedDate?.year}-${joinedDate?.month.toString().padLeft(2, "0")}-${joinedDate?.day.toString().padLeft(2, "0")}';
    }
    return null;
  }
}
