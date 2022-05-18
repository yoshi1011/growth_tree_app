// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../data/repository/auth_repository.dart';
import '../models/result.dart';
import '../models/user.dart';
import 'user_state.dart';

final userStateNotifier =
    StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  return UserStateNotifier(ref.read);
});

// 全ページに跨ってログイン状態を保持するためのNotifier
class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier(this._reader) : super(UserState());

  final Reader _reader;

  late final AuthRepository _repository = _reader(authRepositoryProvider);

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
    state = state.copyWith(user: user);
  }

  void removeUser() {
    state = state.copyWith(user: null);
  }

  bool isLoggedIn() {
    return state.user != null;
  }

  Future<void> initLoad() async {
    Result<User?> result = await _repository.validateToken();
    result.when(success: (user) {
      state = state.copyWith(user: user);
    }, error: (_) {
      state = state.copyWith(user: null);
    });
  }
}
