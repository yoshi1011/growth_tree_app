import 'api.dart';

class AssignedTaskApi {
  static Future<dynamic> taskList({required num userId}) async {
    return await ApiMethod.get('/users/$userId/assigned_tasks');
  }

  static Future<dynamic> assignTask({required num userId, required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/users/$userId/assigned_tasks', body);
  }

  static Future<dynamic> updateTaskSchedule({required num userId, required num taskId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/users/$userId/assigned_tasks/$taskId/update_schedule', body);
  }

  static Future<dynamic> updateTaskCompleted({required num userId, required num taskId}) async {
    return await ApiMethod.update('/users/$userId/assigned_tasks/$taskId/update_completed', {});
  }

  static Future<dynamic> unassignTask({required num userId, required num taskId}) async {
    return await ApiMethod.delete('/users/$userId/assigned_tasks/$taskId');
  }
}
