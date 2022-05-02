import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Auth {
  static Future<String> login(
      WidgetRef ref, String email, String password) async {
    var dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));
    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    if (email.isEmpty & password.isEmpty) {
      return 'login form empty';
    }

    String result = await dio.post('/auth/sign_in',
        data: {'email': email, 'password': password}).then(
      (response) async {
        return 'success';
      },
    ).catchError(
      (error) {
        return error.toString();
      },
    );

    return result;
  }

  static Future<String> logout(WidgetRef ref) async {
    var dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));
    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    String result = await dio.delete('/auth/sign_out').then(
      (response) async {
        return 'success';
      },
    ).catchError(
      (error) {
        return error.toString();
      },
    );

    return result;
  }
}
