import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repository/curriculum_repository.dart';
import '../models/curriculum.dart';
import '../models/result.dart';
import '../models/table_items/curriculum_item.dart';

final curriculumListProvider =
    StateNotifierProvider<CurriculumListViewModel, Result<List<Curriculum>>?>((ref) {
  return CurriculumListViewModel(ref.read);
});

class CurriculumListViewModel extends StateNotifier<Result<List<Curriculum>>?> {
  CurriculumListViewModel(this._reader) : super(null);

  final Reader _reader;

  late final CurriculumRepository _repository = _reader(curriculumRepositoryProvider);

  Result<List<Curriculum>>? get curriculums => state;

  Future<void> list() async {
    // page数、絞り込み条件などを付与する可能性あり
    // Result<List<Curriculum>> curriculumListResult = await _repository.list();
    // return curriculumListResult;
    await _repository.list().then(
      (result) {
        state = result;
      },
    );
  }
}
