// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/result.dart';
import '../../models/skill.dart';
import '../api/skill_api.dart';

final skillRepositoryProvider = Provider((ref) => SkillRepository(ref.read));

class SkillRepository {
  SkillRepository(this._reader);

  final Reader _reader;

  late final SkillApi _api = _reader(skillApiProvider);

  Future<Result<List<Skill>>> list() async {
    return Result.recieveFuture(() async => await _api.list());
  }
}
