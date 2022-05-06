import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/mission.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'mission_api.g.dart';

final missionApiProvider = Provider((ref) => MissionApi((ref.read)));

@RestApi()
abstract class MissionApi {
  factory MissionApi(Reader reader) => _MissionApi(reader(dioProvider));

  @GET('/missions')
  Future<List<Mission>> list();

  @GET('/missions/{missionId}')
  Future<Mission> get(
    @Path('missionId') num missionId,
  );

  @POST('/missions')
  Future<Mission> create(
    @Body() Mission mission,
  );

  @PATCH('/missions/{missionId}')
  Future<Mission> update(
    @Path() num missionId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/missions/{missionId}')
  Future<Mission> delete(
    @Path() num missionId,
  );
}
