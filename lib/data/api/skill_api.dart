// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../models/skill.dart';
import 'app_dio.dart';

part 'skill_api.g.dart';

final skillApiProvider = Provider((ref) => SkillApi((ref.read)));

@RestApi()
abstract class SkillApi {
  factory SkillApi(Reader reader) => _SkillApi(reader(dioProvider));

  @GET('/skills')
  Future<List<Skill>> list();

  @GET('/skills/{skillId}')
  Future<Skill> get(
    @Path('skillId') num skillId,
  );

  @POST('/skills')
  Future<Skill> create(
    @Body() Skill skill,
  );

  @PATCH('/skills/{skillId}')
  Future<Skill> update(
    @Path() num skillId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/skills/{skillId}')
  Future<Skill> delete(
    @Path() num skillId,
  );

  // body...skillId, point
  @POST('/skills/{skillId}/points')
  Future<Skill> attachPoint(
    @Path() num skillId,
    @Body() Map<String, dynamic> body,
  );

  // body...point
  @PATCH('/skills/{skillId}/points/{skillPointId}')
  Future<Skill> updatePoint(
    @Path() num skillId,
    @Path() num skillPointId,
    @Body() Map<String, dynamic> body,
  );
}
