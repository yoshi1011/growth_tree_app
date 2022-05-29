// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/user.dart';
import '../../models/result.dart';
import '../api/user_api.dart';

final userRepositoryProvider = Provider((ref) => UserRepository(ref.read));

class UserRepository {
  UserRepository(this._reader);

  final Reader _reader;

  late final UserApi _api = _reader(userApiProvider);

  Future<Result<User>> get({required num userId}) async {
    return Result.recieveFuture(
      () async => await _api.get(userId),
    );
  }

  Future<Result<User?>> getCurrentUser() async {
    return Result.recieveFuture(
      () async => await _api.getCurrentUser(),
    );
  }

  Future<Result<User>> updateProfileSetting(
      {required num userId,
      required String firstName,
      required String lastName,
      required DateTime birthday,
      required DateTime joinedDate}) async {
    Map<String, dynamic> body = {
      'profile': {
        'first_name': firstName,
        'last_name': lastName,
        'birthday': birthday,
        'joined_date': joinedDate,
      }
    };
    return Result.recieveFuture(
      () async => await _api.updateProfileSetting(userId, body),
    );
  }
}
