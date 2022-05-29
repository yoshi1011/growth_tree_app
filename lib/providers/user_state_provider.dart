// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../data/repository/auth_repository.dart';
import '../models/result.dart';
import '../models/user.dart';

final userStateProvider =
    StateNotifierProvider<UserStateProvider, User?>((ref) {
  return UserStateProvider(ref.read);
});

// 全ページに跨ってログイン状態を保持するためのNotifier
class UserStateProvider extends StateNotifier<User?> {
  UserStateProvider(this._reader) : super(null);

  final Reader _reader;

  late final AuthRepository _repository = _reader(authRepositoryProvider);

  User? get user => state;

  Future<void> login({required String email, required String password}) async {
    return _repository.login(email: email, password: password).then(
      (result) {
        result.ifSuccess(
          (data) {
            setUser(data);
          },
        );
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthday,
    required String companyName,
    required String zipCode,
    required String prefecture,
    required String city,
    required String addressLine1,
    String? addressLine2,
  }) async {
    return _repository.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      birthday: birthday,
      companyName: companyName,
      zipCode: zipCode,
      prefecture: prefecture,
      city: city,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
    ).then(
      (result) {
        result.ifSuccess(
          (data) {
            setUser(data);
          },
        );
      },
    );
  }

  Future<void> logout() async {
    return _repository.logout().then(
      (result) {
        return result.when(
          success: (_) {
            removeUser();
          },
          error: (_) {},
        );
      },
    );
  }

  void setUser(User user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }

  bool isLoggedIn() {
    return state != null;
  }

  Future<void> initLoad() async {
    Result<User?> result = await _repository.validateToken();
    result.when(success: (user) {
      state = user;
    }, error: (_) {
      state = null;
    });
  }
}
