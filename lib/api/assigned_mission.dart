import 'api.dart';

class AssignedMissionApi {
  static Future<dynamic> missionList({required num userId}) async {
    return await ApiMethod.get('/users/$userId/assigned_missions');
  }

  static Future<dynamic> assignMission({required num userId, required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/users/$userId/assigned_missions', body);
  }

  static Future<dynamic> updateMissionSchedule({required num userId, required num missionId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/users/$userId/assigned_missions/$missionId/update_schedule', body);
  }

  static Future<dynamic> updateMissionCompleted({required num userId, required num missionId}) async {
    return await ApiMethod.update('/users/$userId/assigned_missions/$missionId/update_completed', {});
  }

  static Future<dynamic> unassignMission({required num userId, required num missionId}) async {
    return await ApiMethod.delete('/users/$userId/assigned_missions/$missionId');
  }
}
