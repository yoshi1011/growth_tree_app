// Project imports:
import 'table_item.dart';

class MemberItem implements TableItem {
  final String name;
  final String missionName;
  final String lastUpdated;

  MemberItem(this.name, this.missionName, this.lastUpdated);

  @override
  List toList() {
    return [name, missionName, lastUpdated];
  }
}
