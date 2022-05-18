// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'app_dio.dart';

part 'set_task_api.g.dart';

final setTaskApiProvider = Provider((ref) => SetTaskApi((ref.read)));

@RestApi()
abstract class SetTaskApi {
  factory SetTaskApi(Reader reader) => _SetTaskApi(reader(dioProvider));

  @POST('/missions/{missionId}/tasks/{taskId}')
  Future<dynamic> set(
    @Path() num missionId,
    @Path() num taskId,
  );

  @POST('/missions/{missionId}/tasks/{taskId}')
  Future<dynamic> remove(
    @Path() num missionId,
    @Path() num taskId,
  );
}
