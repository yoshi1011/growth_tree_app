
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import 'user_state.dart';


class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState());

  void setUser(User user) {
    state = state.copyWith(user: user);
  }

  void removeUser() {
    state = state.copyWith(user: null);
  }
}

final userNotifier = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
