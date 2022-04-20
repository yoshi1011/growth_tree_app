// Project imports:
import 'package:growth_tree_app/models/table_items/table_item.dart';
import '../skill.dart';

class MissionItem implements TableItem {
  final String name;
  final int missionCount;
  final int settingCount;
  final List<Skill> targetSkills;

  MissionItem(this.name, this.missionCount, this.settingCount, this.targetSkills);

  @override
  List toList() {
    return[name, missionCount, settingCount, targetSkills];
  }
}
