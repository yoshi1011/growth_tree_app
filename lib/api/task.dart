import 'api.dart';

class TaskApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/tasks');
  }

  static Future<dynamic> get({required num taskId}) async {
    return await ApiMethod.get('/tasks/$taskId');
  }

  static Future<dynamic> create({required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/tasks', body);
  }

  static Future<dynamic> update(
      {required num taskId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/tasks/$taskId', body);
  }

  static Future<dynamic> delete({required num taskId}) async {
    return await ApiMethod.delete('/tasks/$taskId');
  }
}
