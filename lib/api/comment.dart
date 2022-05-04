import 'api.dart';

class CommentApi {
  static Future<dynamic> list(
      {required num userId, required num assignedTaskId}) async {
    return await ApiMethod.get(
        '/users/$userId/assigned_tasks/$assignedTaskId/comments');
  }

  static Future<dynamic> get(
      {required num userId, required num assignedTaskId, required num commentId}) async {
    return await ApiMethod.get(
        '/users/$userId/assigned_tasks/$assignedTaskId/comments/$commentId');
  }

  static Future<dynamic> post(
      {required num userId,
      required num assignedTaskId,
      required Map<String, dynamic> body}) async {
    return await ApiMethod.post(
        '/users/$userId/assigned_tasks/$assignedTaskId/comments', body);
  }

  static Future<dynamic> update(
      {required num userId,
      required num assignedTaskId,
      required num commentId,
      required Map<String, dynamic> body}) async {
    return await ApiMethod.update(
        '/users/$userId/assigned_tasks/$assignedTaskId/comments/$commentId',
        body);
  }

  static Future<dynamic> delete(
      {required num userId,
      required num assignedTaskId,
      required num commentId}) async {
    return await ApiMethod.delete(
        '/users/$userId/assigned_tasks/$assignedTaskId/comments/$commentId');
  }
}
