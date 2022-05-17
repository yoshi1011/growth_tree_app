import '../curriculum.dart';
import '../skill.dart';
import '../user.dart';
import 'table_item.dart';

class CurriculumItem implements TableItem {
  final String name;
  final int missionCount;
  final Set<User> activeUsers;
  final Set<Skill> skills;

  CurriculumItem(this.name, this.missionCount, this.activeUsers, this.skills);

  CurriculumItem.fromCurriculum(Curriculum curriculum)
      : this(
            curriculum.name,
            curriculum.missions.length,
            curriculum.users,
            curriculum.missions
                .map((mission) => mission.skills)
                .toSet()
                .expand((skill) => skill)
                .toSet());

  @override
  List toList() {
    return [name, missionCount, activeUsers, skills];
  }
}
