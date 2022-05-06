import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_dio.dart';

class ApiMethod {
  static Future<dynamic> get(String params) async {
    var dio = Dio(
      BaseOptions(baseUrl: 'http://localhost:3000/api/v1'),
    );
    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    Options options = Options(
      responseType: ResponseType.json,
    );

    var result = await dio.get(params, options: options).then(
      (response) async {
        return response.data;
      },
    ).catchError(
      (error) {
        if (error.error == 'Http status error [401]') {
          return {
            'status': false,
            'errors': ['unauthorized'],
          };
        }
        return error.toString();
      },
    );
    return result;
  }

  static Future<dynamic> post(String params, Map<String, dynamic> body) async {
    var dio = Dio(
      BaseOptions(baseUrl: 'http://localhost:3000/api/v1'),
    );

    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    Options options = Options(
      responseType: ResponseType.json,
    );

    var result = dio.post(params, options: options, data: {'body': body}).then(
      (response) async {

        return response.data;
      },
    ).catchError(
      (error) {
        if (error.error == 'Http status error [401]') {
          return {
            'status': false,
            'errors': ['unauthorized'],
          };
        }
        return error.toString();
      },
    );
    return result;
  }

  static Future<dynamic> update(String params, Map<String, dynamic> body) async {
    var dio = Dio(
      BaseOptions(baseUrl: 'http://localhost:3000/api/v1'),
    );
    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    Options options = Options(
      responseType: ResponseType.json,
    );

    var result = dio.patch(params, options: options, data: {'body': body}).then(
          (response) async {

        return response.data;
      },
    ).catchError(
          (error) {
        if (error.error == 'Http status error [401]') {
          return {
            'status': false,
            'errors': ['unauthorized'],
          };
        }
        return error.toString();
      },
    );
    return result;
  }

  static Future<dynamic> delete(String params) async {
    var dio = Dio(
      BaseOptions(baseUrl: 'http://localhost:3000/api/v1'),
    );
    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;
    dio.httpClientAdapter = clientAdapter;

    Options options = Options(
      responseType: ResponseType.json,
    );

    var result = await dio.delete(params, options: options).then(
      (response) async {

        return response.data;
      },
    ).catchError(
      (error) {
        if (error.error == 'Http status error [401]') {
          return {
            'status': false,
            'errors': ['unauthorized'],
          };
        }
        return error.toString();
      },
    );
    return result;
  }
}
