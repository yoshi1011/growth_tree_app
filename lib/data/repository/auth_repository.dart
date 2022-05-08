import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/result.dart';
import '../../models/user.dart';
import '../api/auth_api.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository {
  AuthRepository(this._reader);

  final Reader _reader;

  late final AuthApi _api = _reader(authApiProvider);

  Future<Result<User?>> validateToken() async {
    return Result.recieveFuture(() async => await _api.validateToken());
  }
  // Future<AsyncValue<User?>> validateToken() async {
  //   return AsyncValue.guard(() async => await _api.validateToken());
  // }

  Future<Result<User>> login({required String email, required String password}) async {
    Map<String, dynamic> body = {'email': email, 'password': password};

    return Result.recieveFuture(() async => await _api.login(body));
  }

  Future<Result<void>> logout() async {
    return Result.recieveFuture(() async => await _api.logout());
  }
}
