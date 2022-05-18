// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../models/task.dart';
import 'app_dio.dart';

part 'task_api.g.dart';

final taskApiProvider = Provider((ref) => TaskApi((ref.read)));

@RestApi()
abstract class TaskApi {
  factory TaskApi(Reader reader) => _TaskApi(reader(dioProvider));

  @GET('/tasks')
  Future<List<Task>> list();

  @GET('/tasks/{taskId}')
  Future<Task> get(
    @Path('taskId') num taskId,
  );

  @POST('/tasks')
  Future<Task> create(
    @Body() Task task,
  );

  @PATCH('/tasks/{taskId}')
  Future<Task> update(
    @Path() num taskId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/tasks/{taskId}')
  Future<Task> delete(
    @Path() num taskId,
  );
}
