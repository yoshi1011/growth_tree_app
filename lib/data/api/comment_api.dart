import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/comment.dart';
import 'app_dio.dart';
import 'package:dio/dio.dart';

part 'comment_api.g.dart';

final commentApiProvider = Provider((ref) => CommentApi((ref.read)));

@RestApi()
abstract class CommentApi {
  factory CommentApi(Reader reader) => _CommentApi(reader(dioProvider));

  @GET('/users/{userId}/assigned_tasks/{assignedTaskId}/comments')
  Future<List<Comment>> list(
    @Path('userId') num userId,
    @Path('assignedTaskId') num assignedTaskId,
  );

  @GET('/users/{userId}/assigned_tasks/{assignedTaskId}/comments/{commentId}')
  Future<Comment> get(
    @Path('userId') num userId,
    @Path('assignedTaskId') num assignedTaskId,
    @Path('commentId') num commentId,
  );

  @POST('/users/{userId}/assigned_tasks/{assignedTaskId}/comments')
  Future<Comment> create(
    @Path() num userId,
    @Path() num assignedTaskId,
    @Body() Comment comment,
  );

  @PATCH('/users/{userId}/assigned_tasks/{assignedTaskId}/comments/{commentId}')
  Future<Comment> update(
    @Path() num userId,
    @Path() num assignedTaskId,
    @Path('commentId') num commentId,
    @Body() Comment comment,
  );

  @DELETE('/users/{userId}/assigned_tasks/{assignedTaskId}/comments/{commentId}')
  Future<Comment> delete(
    @Path() num userId,
    @Path() num assignedTaskId,
    @Path() num commentId,
  );
}
