// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'mission.dart';
import 'user.dart';

part 'curriculum.freezed.dart';
part 'curriculum.g.dart';

@freezed
class Curriculum with _$Curriculum {
  const factory Curriculum({
    required String name,
    required String description,
    required Set<User> users,
    required Set<Mission> missions,
  }) = _Curriculum;

  factory Curriculum.fromJson(Map<String, dynamic> json) => _$CurriculumFromJson(json);
}
