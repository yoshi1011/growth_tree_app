import 'api.dart';

class SkillApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/skills');
  }

  static Future<dynamic> get(num id) async {
    return await ApiMethod.get('/skills/$id');
  }

  static Future<dynamic> create(Map<String, dynamic> body) async {
    return await ApiMethod.post('/skills', body);
  }

  static Future<dynamic> update(num id, Map<String, dynamic> body) async {
    return await ApiMethod.update('/skills/$id', body);
  }

  static Future<dynamic> delete(num id) async {
    return await ApiMethod.delete('/skills/$id');
  }

  static Future<dynamic> attachToMission(
      {required num missionId,
      required num skillId,
      required num point}) async {
    Map<String, num> body = {'skill_id': skillId, 'point': point};
    return await ApiMethod.post('/missions/$missionId/skills', body);
  }

  static Future<dynamic> updatePoint(
      {required num missionId,
      required num skillId,
      required num point}) async {
    Map<String, num> body = {'point': point};
    return await ApiMethod.update('/missions/$missionId/skills/$skillId', body);
  }

  static Future<dynamic> attachToUser(
      {required num userId, required num skillId, required num point}) async {
    Map<String, num> body = {'skill_id': skillId, 'point': point};
    return await ApiMethod.post('/users/$userId/skills', body);
  }

  static Future<dynamic> updateUserPoint(
      {required num userId, required num skillId, required num point}) async {
    Map<String, num> body = {'point': point};
    return await ApiMethod.update('/users/$userId/skills/$skillId', body);
  }
}
