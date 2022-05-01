import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/constants.dart';

class ApiMethod {
  static Future<dynamic> get(String params) async {
    var dio = Dio(
      BaseOptions(baseUrl: 'http://localhost:3000/api/v1'),
    );

    var storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: Constant.accessToken);
    final client = await storage.read(key: Constant.client);
    final expiry = await storage.read(key: Constant.expiry);
    final uid = await storage.read(key: Constant.uid);

    Options options = Options(
      responseType: ResponseType.json,
      headers: {
        'token-type': 'Bearer',
        'access-token': accessToken,
        'client': client,
        'expiry': expiry,
        'uid': uid
      },
    );

    var result = await dio.get(params, options: options).then(
      (response) async {
        Headers headers = response.headers;
        // access-tokenは毎回更新されるため、
        // headersに含まれている(有効な通信が得られた)場合は再セットする
        if (headers['access-token'] != null) {
          await storage.write(
            key: Constant.accessToken,
            value: headers['access-token']![0],
          );
        }

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

    var storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: Constant.accessToken);
    final client = await storage.read(key: Constant.client);
    final expiry = await storage.read(key: Constant.expiry);
    final uid = await storage.read(key: Constant.uid);

    Options options = Options(
      responseType: ResponseType.json,
      headers: {
        'token-type': 'Bearer',
        'access-token': accessToken,
        'client': client,
        'expiry': expiry,
        'uid': uid
      },
    );

    var result = dio.post(params, options: options, data: body).then(
      (response) async {
        Headers headers = response.headers;
        // access-tokenは毎回更新されるため、
        // headersに含まれている(有効な通信が得られた)場合は再セットする
        if (headers['access-token'] != null) {
          await storage.write(
            key: Constant.accessToken,
            value: headers['access-token']![0],
          );
        }

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

    var storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: Constant.accessToken);
    final client = await storage.read(key: Constant.client);
    final expiry = await storage.read(key: Constant.expiry);
    final uid = await storage.read(key: Constant.uid);

    Options options = Options(
      responseType: ResponseType.json,
      headers: {
        'token-type': 'Bearer',
        'access-token': accessToken,
        'client': client,
        'expiry': expiry,
        'uid': uid
      },
    );

    var result = dio.patch(params, options: options, data: body).then(
          (response) async {
        Headers headers = response.headers;
        // access-tokenは毎回更新されるため、
        // headersに含まれている(有効な通信が得られた)場合は再セットする
        if (headers['access-token'] != null) {
          await storage.write(
            key: Constant.accessToken,
            value: headers['access-token']![0],
          );
        }

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

    var storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: Constant.accessToken);
    final client = await storage.read(key: Constant.client);
    final expiry = await storage.read(key: Constant.expiry);
    final uid = await storage.read(key: Constant.uid);

    Options options = Options(
      responseType: ResponseType.json,
      headers: {
        'token-type': 'Bearer',
        'access-token': accessToken,
        'client': client,
        'expiry': expiry,
        'uid': uid
      },
    );

    var result = await dio.delete(params, options: options).then(
      (response) async {
        Headers headers = response.headers;
        // access-tokenは毎回更新されるため、
        // headersに含まれている(有効な通信が得られた)場合は再セットする
        if (headers['access-token'] != null) {
          await storage.write(
            key: Constant.accessToken,
            value: headers['access-token']![0],
          );
        }

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
