import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/curriculum.dart';
import '../../models/result.dart';
import '../api/curriculum_api.dart';

final curriculumRepositoryProvider = Provider((ref) => CurriculumRepository(ref.read));

class CurriculumRepository {
  CurriculumRepository(this._reader);

  final Reader _reader;

  late final CurriculumApi _api = _reader(curriculumApiProvider);

  Future<Result<List<Curriculum>>> list() async {
    return Result.recieveFuture(() async => await _api.list());
  }

  Future<Result<Curriculum>> get({required num curriculumId}) async {
    return Result.recieveFuture(() async => await _api.get(curriculumId));
  }

  Future<Result<Curriculum>> create({required Curriculum curriculum}) async {
    return Result.recieveFuture(() async => await _api.create(curriculum));
  }
}
