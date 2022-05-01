import 'api.dart';

class CurriculumApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/curriculums');
  }

  static Future<dynamic> get(num id) async {
    return await ApiMethod.get('/curriculums/$id');
  }

  static Future<dynamic> create(Map<String, dynamic> body) async {
    return await ApiMethod.post('/curriculums', body);
  }

  static Future<dynamic> update(num id, Map<String, dynamic> body) async {
    return await ApiMethod.update('/curriculums/$id', body);
  }

  static Future<dynamic> delete(num id) async {
    return await ApiMethod.delete('/curriculums/$id');
  }
}
