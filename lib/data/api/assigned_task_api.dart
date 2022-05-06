import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/task.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'assigned_task_api.g.dart';

final assignedTaskApiProvider = Provider((ref) => AssignedTaskApi((ref.read)));

@RestApi()
abstract class AssignedTaskApi {
  factory AssignedTaskApi(Reader reader) =>
      _AssignedTaskApi(reader(dioProvider));

  @GET('/users/{userId}assigned_tasks')
  Future<List<Task>> curriculumList(
      @Path('userId') num userId,
      );

  @GET('/users/{userId}/assigned_tasks/{assignedMissionId}')
  Future<Task> get(
      @Path('userId') num userId,
      @Path('assignedMissionId') num assignedMissionId,
      );

  @POST('/users/{userId}/assigned_tasks/')
  Future<Task> create(
      @Path() num userId,
      @Path() num assignedMissionId,
      @Body() Map<String, dynamic> body,
      );

  @PATCH('/users/{userId}/assigned_tasks/{assignedMissionId}/update_schedule')
  Future<Task> updateSchedule(
      @Path() num userId,
      @Path() num assignedMissionId,
      @Body() Map<String, dynamic> body,
      );

  @PATCH('/users/{userId}/assigned_tasks/{assignedMissionId}/update_completed')
  Future<Task> updateCompleted(
      @Path() num userId,
      @Path() num assignedMissionId,
      );

  @DELETE('/users/{userId}/assigned_tasks/{assignedMissionId}')
  Future<Task> delete(
      @Path() num userId,
      @Path() num assignedMissionId,
      );
}
