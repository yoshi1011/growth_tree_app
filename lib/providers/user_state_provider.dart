// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../data/repository/auth_repository.dart';
import '../data/repository/user_repository.dart';
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

  late final AuthRepository _authRepository = _reader(authRepositoryProvider);
  late final UserRepository _userRepository = _reader(userRepositoryProvider);

  User? get user => state;

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
    Result<User?> result = await _authRepository.validateToken();
    result.when(success: (user) {
      state = user;
    }, error: (_) {
      state = null;
    });
  }

  Future<void> login({required String email, required String password}) async {
    return _authRepository.login(email: email, password: password).then(
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
    return _authRepository.signUp(
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
    return _authRepository.logout().then(
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

  Future<void> updateImage({required String imageUrl}) async {
    await _userRepository
        .updateImage(imageUrl: imageUrl)
        .then(
      (result) {
        result.when(
          success: (user) {
            state = state!.copyWith(imageUrl: user.imageUrl);
          },
          error: (err) {
            print(err);
          },
        );
      },
    );
  }

  Future<void> updateLoginSetting({
    required String email,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    await _userRepository.updateLoginSetting(
      email: email,
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  Future<void> updateProfileSetting({
    required String firstName,
    required String lastName,
    required String birthday,
    String? joinedDate,
  }) async {
    await _userRepository.updateProfileSetting(
      firstName: firstName,
      lastName: lastName,
      birthday: DateTime.parse(birthday),
      joinedDate: joinedDate != null ? DateTime.parse(joinedDate) : null,
    ).then((result) {
      result.when(success: (user) {
        state = user;
      }, error: (err) {
        print(err);
      });
    });
  }
}
