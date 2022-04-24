import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  factory Comment(
      {required String content,
      String? attachmentName,
      required String datetime,
      required String action}) = _Comment;
}
