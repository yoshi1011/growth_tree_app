// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'app_dio.dart';

part 'set_mission_api.g.dart';

final setMissionApiProvider = Provider((ref) => SetMissionApi((ref.read)));

@RestApi()
abstract class SetMissionApi {
  factory SetMissionApi(Reader reader) => _SetMissionApi(reader(dioProvider));

  @POST('/curriculums/{curriculumId}/missions/{missionId}')
  Future<dynamic> set(
    @Path() num curriculumId,
    @Path() num missionId,
  );

  @POST('/curriculums/{curriculumId}/missions/{missionId}')
  Future<dynamic> remove(
    @Path() num curriculumId,
    @Path() num missionId,
  );
}
