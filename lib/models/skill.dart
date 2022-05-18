// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../utils/colors.dart';
import 'user.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String name,
    String? description,
    required Set<User> users,
    @JsonKey(name: 'color') @ColorConverter() required Color themeColor,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String value) {
    switch (value) {
      case 'black':
        return GrowthTreeColors.black;
      case 'red':
        return GrowthTreeColors.red;
      case 'yellow':
        return GrowthTreeColors.yellow;
      case 'blue':
        return GrowthTreeColors.blue;
      case 'green':
        return GrowthTreeColors.themeColor;
      case 'gray':
        return GrowthTreeColors.lightGray;
      default:
        return GrowthTreeColors.black;
    }
  }

  @override
  String toJson(Color themeColor) {
    if(themeColor== GrowthTreeColors.black){
      return 'black';
    } else if (themeColor== GrowthTreeColors.red) {
      return 'red';
    } else if (themeColor== GrowthTreeColors.yellow) {
      return 'yellow';
    } else if (themeColor== GrowthTreeColors.blue) {
      return 'blue';
    } else if (themeColor== GrowthTreeColors.themeColor) {
      return 'green';
    } else if (themeColor== GrowthTreeColors.lightGray) {
      return 'gray';
    } else {
      return 'black';
    }
  }
}
