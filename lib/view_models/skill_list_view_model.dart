// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../data/repository/skill_repository.dart';
import '../models/result.dart';
import '../models/skill.dart';

final skillListProvider =
    StateNotifierProvider<SkillListViewModel, Result<List<Skill>>?>((ref) {
  return SkillListViewModel(ref.read);
});

class SkillListViewModel extends StateNotifier<Result<List<Skill>>?> {
  SkillListViewModel(this._reader) : super(null);

  final Reader _reader;

  late final SkillRepository _repository = _reader(skillRepositoryProvider);

  Result<List<Skill>>? get skills => state;

  Future<void> list() async {
    // page数、絞り込み条件などを付与する可能性あり
    await _repository.list().then(
      (result) {
        state = result;
      },
    );
  }
}
