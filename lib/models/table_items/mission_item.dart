import '../mission.dart';
import 'table_item.dart';
import '../skill.dart';

class MissionItem implements TableItem {
  final String name;
  final int taskCount;
  final int settingCount;
  final Set<Skill> skills;

  MissionItem(
      this.name, this.taskCount, this.settingCount, this.skills);

  MissionItem.fromMission(Mission mission)
  : this(
    mission.name,
    mission.tasks.length,
    mission.settingCount,
    mission.skills
  );

  @override
  List toList() {
    return [name, taskCount, settingCount, skills];
  }
}
