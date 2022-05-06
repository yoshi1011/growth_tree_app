import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/auth_api.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository {
  AuthRepository(this._reader);

  final Reader _reader;

  late final AuthApi _api = _reader(authApiProvider);

  Future<String> login(String email, String password) async {
    if (email.isEmpty & password.isEmpty) {
      return 'login form empty';
    }

    Map<String, dynamic> body = {'email': email, 'password': password};

    var user = await _api.login(body).then((response){
    }).catchError((error) {
      switch (error.runtimeType) {
        case DioError:
          final res = (error as DioError).response;
          break;
        default:
          break;
      }
    });

    return 'success';
  }

  Future<String> logout() async {
    var user = await _api.logout();

    return 'success';
  }
}
