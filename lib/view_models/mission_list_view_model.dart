// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../data/repository/mission_repository.dart';
import '../models/mission.dart';
import '../models/result.dart';

final missionListProvider =
    StateNotifierProvider<MissionListViewModel, Result<List<Mission>>?>((ref) {
  return MissionListViewModel(ref.read);
});

class MissionListViewModel extends StateNotifier<Result<List<Mission>>?> {
  MissionListViewModel(this._reader) : super(null);

  final Reader _reader;

  late final MissionRepository _repository = _reader(missionRepositoryProvider);

  Result<List<Mission>>? get missions => state;

  Future<void> list() async {
    // page数、絞り込み条件などを付与する可能性あり
    await _repository.list().then(
      (result) {
        state = result;
      },
    );
  }
}
