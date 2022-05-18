// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user.dart';
import '../providers/user_provider.dart';

final loginViewModelProvider =
    StateNotifierProvider((ref) => LoginViewModel(ref.read));

class LoginViewModel extends StateNotifier<AsyncValue<User>> {
  LoginViewModel(this._reader) : super(const AsyncLoading());

  final Reader _reader;

  late final UserStateNotifier _userStateNotifier = _reader(userStateNotifier.notifier);

  Future<void> login(email, password) async {
    if (email.isEmpty & password.isEmpty) {
      return;
    }

    await _userStateNotifier.login(email: email, password: password);
  }
}
