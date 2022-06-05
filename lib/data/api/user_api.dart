// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../models/skill.dart';
import '../../models/user.dart';
import 'app_dio.dart';

part 'user_api.g.dart';

final userApiProvider = Provider((ref) => UserApi((ref.read)));

@RestApi()
abstract class UserApi {
  factory UserApi(Reader reader) => _UserApi(reader(dioProvider));

  @GET('/users')
  Future<List<User>> list();

  @GET('/users/{userId}')
  Future<User> get(
    @Path('userId') num userId,
  );

  @POST('/users')
  Future<User> create(
    @Body() User user,
  );

  @PATCH('/users/{userId}')
  Future<User> update(
    @Path() num userId,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/update_image')
  Future<User> updateImage(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/update_role')
  Future<User> updateRole(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/update_login_setting')
  Future<User> updateLoginSetting(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/users/update_profile_setting')
  Future<User> updateProfileSetting(
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/users/{userId}')
  Future<User> delete(
    @Path() num userId,
  );

  // body...skillId, point
  @POST('/users/{userId}/skills')
  Future<Skill> attachSkill(
    @Path() num userId,
    @Body() Map<String, dynamic> body,
  );

  // body...point
  @PATCH('/users/{userId}/skills/{skillId}')
  Future<Skill> updatePoint(
    @Path() num userId,
    @Body() Map<String, dynamic> body,
  );
}
