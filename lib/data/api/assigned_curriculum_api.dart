import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/curriculum.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'assigned_curriculum_api.g.dart';

final assignedCurriculumApiProvider = Provider((ref) => AssignedCurriculumApi((ref.read)));

@RestApi()
abstract class AssignedCurriculumApi {
  factory AssignedCurriculumApi(Reader reader) =>
      _AssignedCurriculumApi(reader(dioProvider));

  @GET('/users/{userId}assigned_curriculums')
  Future<List<Curriculum>> curriculumList(
    @Path('userId') num userId,
  );

  @GET('/users/{userId}/assigned_curriculums/{assignedCurriculumId}')
  Future<Curriculum> get(
    @Path('userId') num userId,
    @Path('assignedCurriculumId') num assignedCurriculumId,
  );

  @POST('/users/{userId}/assigned_curriculums/')
  Future<Curriculum> create(
    @Path() num userId,
    @Path() num assignedCurriculumId,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/{userId}/assigned_curriculums/{assignedCurriculumId}/update_schedule')
  Future<Curriculum> updateSchedule(
    @Path() num userId,
    @Path() num assignedCurriculumId,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/{userId}/assigned_curriculums/{assignedCurriculumId}/update_completed')
  Future<Curriculum> updateCompleted(
    @Path() num userId,
    @Path() num assignedCurriculumId,
  );

  @DELETE('/users/{userId}/assigned_curriculums/{assignedCurriculumId}')
  Future<Curriculum> delete(
    @Path() num userId,
    @Path() num assignedCurriculumId,
  );
}
