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

  Future<Result<User>> updateImage(
      {required String imageUrl}) async {
    Map<String, dynamic> body = {
      'image_url': imageUrl,
    };
    return Result.recieveFuture(
      () async => await _api.updateImage(body),
    );
  }

  Future<Result<User>> updateLoginSetting({
    required String email,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> body = {
      'profile': {
        'email': email,
        'current_password': currentPassword,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }
    };
    return Result.recieveFuture(() async => await _api.updateLoginSetting(body));
  }

  Future<Result<User>> updateProfileSetting(
      {required String firstName,
      required String lastName,
      required DateTime birthday,
      DateTime? joinedDate}) async {

    // TODO: DateTime => Stringの変換処理をViewModelなどに委ねるべきか, Repositoryに任せるべきか
    //  DB取得のために必要な措置としてString変換を行っているという考え方でRepositoryに記述しているが、
    //  見直して必要があれば修正する

    String encodedBirthday = birthday.toString();
    String? encodedJoinedDate = joinedDate?.toString();
    Map<String, dynamic> body = {
      'profile': {
        'first_name': firstName,
        'last_name': lastName,
        'birthday': encodedBirthday,
        'joined_date': encodedJoinedDate,
      }
    };
    return Result.recieveFuture(
      () async => await _api.updateProfileSetting(body),
    );
  }
}
