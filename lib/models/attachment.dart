// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String name,
    required String url,
  }) = _Attachment;

factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}
