import 'api.dart';

class MissionApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/missions');
  }

  static Future<dynamic> get({required num missionId}) async {
    return await ApiMethod.get('/missions/$missionId');
  }

  static Future<dynamic> create({required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/missions', body);
  }

  static Future<dynamic> update(
      {required num missionId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/missions/$missionId', body);
  }

  static Future<dynamic> delete({required num missionId}) async {
    return await ApiMethod.delete('/missions/$missionId');
  }
}
