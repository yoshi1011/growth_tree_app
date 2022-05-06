import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:3000/api/v1',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    this.options = options;

    final clientAdapter = BrowserHttpClientAdapter();
    clientAdapter.withCredentials = true;

    httpClientAdapter = clientAdapter;
  }

  static Dio getInstance() => AppDio._();
}

final dioProvider = Provider((ref) => AppDio.getInstance());
