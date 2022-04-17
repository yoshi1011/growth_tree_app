import '../skill.dart';
import '../user.dart';

class CurriculumItem {
  final String name;
  final int missionCount;
  final List<User> activeUsers;
  final List<Skill> targetSkills;

  CurriculumItem(this.name, this.missionCount, this.activeUsers, this.targetSkills);

  List toList() {
    return[name, missionCount, activeUsers, targetSkills];
  }
}
