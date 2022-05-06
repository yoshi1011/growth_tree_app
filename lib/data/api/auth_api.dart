import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/user.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider((ref) => AuthApi(ref.read));

@RestApi(baseUrl: 'http://localhost:3000') // authのみbaseUrlが変わるので上書き
abstract class AuthApi {
  factory AuthApi(Reader reader) => _AuthApi(reader(dioProvider));

  @POST('/auth/sign_in')
  Future<User?> login(@Body() Map<String, dynamic> body);

  @DELETE('/auth/sign_out')
  Future<void> logout();
}
