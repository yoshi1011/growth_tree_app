import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/curriculum.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'curriculum_api.g.dart';

final curriculumApiProvider = Provider((ref) => CurriculumApi((ref.read)));

@RestApi()
abstract class CurriculumApi {
  factory CurriculumApi(Reader reader) => _CurriculumApi(reader(dioProvider));

  @GET('/curriculums')
  Future<List<Curriculum>> list();

  @GET('/curriculums/{curriculumId}')
  Future<Curriculum> get(
    @Path('curriculumId') num curriculumId,
  );

  @POST('/curriculums')
  Future<Curriculum> create(
    @Body() Curriculum curriculum,
  );

  @PATCH('/curriculums/{curriculumId}')
  Future<Curriculum> update(
    @Path() num curriculumId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/curriculums/{curriculumId}')
  Future<Curriculum> delete(
    @Path() num curriculumId,
  );
}
