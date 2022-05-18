import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/mission.dart';
import '../../models/result.dart';
import '../api/mission_api.dart';

final missionRepositoryProvider = Provider((ref) => MissionRepository(ref.read));

class MissionRepository {
  MissionRepository(this._reader);

  final Reader _reader;

  late final MissionApi _api = _reader(missionApiProvider);

  Future<Result<List<Mission>>> list() async {
    return Result.recieveFuture(() async => await _api.list());
  }
}
