import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission.dart';

part 'curriculum.freezed.dart';
part 'curriculum.g.dart';

@freezed
class Curriculum with _$Curriculum {
  const factory Curriculum({
    required String name,
    required String description,
    required Set<Mission> missions,
  }) = _Curriculum;

  factory Curriculum.fromJson(Map<String, dynamic> json) => _$CurriculumFromJson(json);
}
