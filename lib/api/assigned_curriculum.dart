import 'api.dart';

class AssignedCurriculumApi {
  static Future<dynamic> curriculumList({required num userId}) async {
    return await ApiMethod.get('/users/$userId/assigned_curriculums');
  }

  static Future<dynamic> assignCurriculum({required num userId, required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/users/$userId/assigned_curriculums', body);
  }

  static Future<dynamic> updateCurriculumSchedule({required num userId, required num curriculumId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/users/$userId/assigned_curriculums/$curriculumId/update_schedule', body);
  }

  static Future<dynamic> updateCurriculumCompleted({required num userId, required num curriculumId}) async {
    return await ApiMethod.update('/users/$userId/assigned_curriculums/$curriculumId/update_completed', {});
  }

  static Future<dynamic> unassignCurriculum({required num userId, required num curriculumId}) async {
    return await ApiMethod.delete('/users/$userId/assigned_curriculums/$curriculumId');
  }
}
