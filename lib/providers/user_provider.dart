import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/constants.dart';
import '../models/user.dart';

// ログイン認証を動かすために作成。くちゃくちゃなので直す
class UserState extends StateNotifier<User> {
  UserState() : super(User());

  Future<void> readSessionData() async {
    var storage = const FlutterSecureStorage();

    final accessToken = await storage.read(key: Constant.accessToken);
    state = state.copyWith(
      accessToken: accessToken,
    );
  }
}

final userProvider = StateNotifierProvider<UserState, User>((ref) {
  return UserState();
});
