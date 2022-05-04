import 'api.dart';

class SetTaskApi {
  static Future<dynamic> set({required num missionId, required num taskId}) async {
    return await ApiMethod.post('/missions/$missionId/tasks/$taskId', {});
  }

  static Future<dynamic> remove({required num missionId, required num taskId}) async {
    return await ApiMethod.delete('/missions/$missionId/tasks/$taskId');
  }
}
