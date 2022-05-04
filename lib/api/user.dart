import 'api.dart';

class UserApi {
  static Future<dynamic> list() async {
    return await ApiMethod.get('/users');
  }

  static Future<dynamic> create({required Map<String, dynamic> body}) async {
    return await ApiMethod.post('/users', body);
  }

  static Future<dynamic> update({required num userId, required Map<String, dynamic> body}) async {
    return await ApiMethod.update('/users/$userId', body);
  }

  // NOTE: roleをどのようにして渡すかは検討中。enumで定義したデータを渡す?
  static Future<dynamic> updateRole({required num userId, required num role}) async {
    return await ApiMethod.update('/users/$userId/update_role', {"role": role});
  }

  static Future<dynamic> delete({required num userId}) async {
    return await ApiMethod.delete('/users/$userId');
  }
}
