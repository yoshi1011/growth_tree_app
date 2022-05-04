import 'api.dart';

class SetMissionApi {
  static Future<dynamic> set({required num curriculumId, required num missionId}) async {
    return await ApiMethod.post('/curriculums/$curriculumId/missions/$missionId', {});
  }

  static Future<dynamic> remove({required num curriculumId, required num missionId}) async {
    return await ApiMethod.delete('/curriculums/$curriculumId/missions/$missionId');
  }
}
