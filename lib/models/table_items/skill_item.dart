// Project imports:
import '../skill.dart';
import '../user.dart';
import 'table_item.dart';

class SkillItem implements TableItem {
  final String name;
  final Set<User> users;
  final String? description;

  SkillItem(this.name, this.users, this.description);

  SkillItem.fromSkill(Skill skill)
      : this(
          skill.name,
          skill.users,
          skill.description,
        );

  @override
  List toList() {
    return [name, users, description];
  }
}
