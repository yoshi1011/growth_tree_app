import 'api.dart';

class CurriculumApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/curriculums');
  }

  static Future<dynamic> get({required num curriculumId}) async {
    return await ApiMethod.get('/curriculums/$curriculumId');
  }

  static Future<dynamic> create({required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/curriculums', body);
  }

  static Future<dynamic> update(
      {required num curriculumId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/curriculums/$curriculumId', body);
  }

  static Future<dynamic> delete({required num curriculumId}) async {
    return await ApiMethod.delete('/curriculums/$curriculumId');
  }
}
