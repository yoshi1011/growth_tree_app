import 'package:growth_tree_app/models/table_items/table_item.dart';

import '../skill.dart';
import '../user.dart';

class CurriculumItem implements TableItem {
  final String name;
  final int missionCount;
  final List<User> activeUsers;
  final List<Skill> targetSkills;

  CurriculumItem(this.name, this.missionCount, this.activeUsers, this.targetSkills);

  @override
  List toList() {
    return[name, missionCount, activeUsers, targetSkills];
  }
}
