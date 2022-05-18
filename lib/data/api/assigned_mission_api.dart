// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../models/mission.dart';
import 'app_dio.dart';

part 'assigned_mission_api.g.dart';

final assignedMissionApiProvider = Provider((ref) => AssignedMissionApi((ref.read)));

@RestApi()
abstract class AssignedMissionApi {
  factory AssignedMissionApi(Reader reader) =>
      _AssignedMissionApi(reader(dioProvider));

  @GET('/users/{userId}assigned_missions')
  Future<List<Mission>> curriculumList(
      @Path('userId') num userId,
      );

  @GET('/users/{userId}/assigned_missions/{assignedMissionId}')
  Future<Mission> get(
      @Path('userId') num userId,
      @Path('assignedMissionId') num assignedMissionId,
      );

  @POST('/users/{userId}/assigned_missions/')
  Future<Mission> create(
      @Path() num userId,
      @Path() num assignedMissionId,
      @Body() Map<String, dynamic> body,
      );

  @PATCH('/users/{userId}/assigned_missions/{assignedMissionId}/update_schedule')
  Future<Mission> updateSchedule(
      @Path() num userId,
      @Path() num assignedMissionId,
      @Body() Map<String, dynamic> body,
      );

  @PATCH('/users/{userId}/assigned_missions/{assignedMissionId}/update_completed')
  Future<Mission> updateCompleted(
      @Path() num userId,
      @Path() num assignedMissionId,
      );

  @DELETE('/users/{userId}/assigned_missions/{assignedMissionId}')
  Future<Mission> delete(
      @Path() num userId,
      @Path() num assignedMissionId,
      );
}
