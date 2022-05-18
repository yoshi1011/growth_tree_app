// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

// 参考
// https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/model/result.dart
@freezed
class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = Success<T>;

  const factory Result.error({required Exception error}) = Error<T>;

  static Future<Result<T>> recieveFuture<T>(
      Future<T> Function() function) async {
    try {
      return Result.success(data: await function());
    } on Exception catch (e) {
      return Result.error(error: Exception(e));
    }
  }

  void ifSuccess(Function(T data) body) {
    maybeWhen(
      success: (data) => body(data),
      orElse: () => null,
    );
  }

  T get dataOrThrow {
    return when(
      success: (data) => data,
      error: (e) => throw e,
    );
  }
}
