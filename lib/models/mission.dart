import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'skill.dart';
import 'task.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  const factory Mission({
    required String name,
    required String description,
    required Set<Skill> skills,
    required Set<Task> tasks,
  }) = _Mission;

  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);
}

