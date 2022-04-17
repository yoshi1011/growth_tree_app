import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:growth_tree_app/providers/user_provider.dart';

class Auth {
  static Future<String> login(WidgetRef ref, String email, String password) async {
    var dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

    if (email.isNotEmpty & password.isNotEmpty) {
      String result = await dio.post('/auth/sign_in',
          data: {'email': email, 'password': password}).then((response) async {
        var result = response.headers;

        await ref.read(userProvider.notifier).saveSessionData(result);

        return 'success';
      }).catchError((error) {
        return error.toString();
      });
      return result;
    } else {
      return 'empty';
    }
  }

  Future<String> logout(WidgetRef ref) async {
    await ref.read(userProvider.notifier).deleteSessionData();

    return 'success';
  }
}
