// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user.dart';
import '../providers/user_state_provider.dart';

final loginViewModelProvider =
    StateNotifierProvider((ref) => LoginViewModel(ref.read));

class LoginViewModel extends StateNotifier<AsyncValue<User>> {
  LoginViewModel(this._reader) : super(const AsyncLoading());

  final Reader _reader;

  late final UserStateProvider _userStateProvider = _reader(userStateProvider.notifier);

  Future<void> login(email, password) async {
    if (email.isEmpty & password.isEmpty) {
      return;
    }

    await _userStateProvider.login(email: email, password: password);
  }
}
