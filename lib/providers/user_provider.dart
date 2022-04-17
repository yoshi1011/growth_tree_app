import 'package:growth_tree_app/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user.dart';

// ログイン認証を動かすために作成。くちゃくちゃなので直す
class UserState extends StateNotifier<User> {
  UserState() : super(User());

  Future<void> saveSessionData(Headers result) async {
    var storage = const FlutterSecureStorage();

    // flutter_secure_storageを使いauth情報を保存
    // TODO: 導入は簡単だがセキュリティに問題を抱えた実装のため、set-cookie取得形式の実装を検討
    await storage.write(
        key: Constant.accessToken, value: result['access-token']![0]);
    await storage.write(key: Constant.client, value: result['client']![0]);
    await storage.write(key: Constant.expiry, value: result['expiry']![0]);
    await storage.write(key: Constant.uid, value: result['uid']![0]);

    state = state.copyWith(accessToken: result['access-token']![0]);
  }

  Future<void> deleteSessionData() async {
    var storage = const FlutterSecureStorage();

    storage.deleteAll();
  }

  Future<void> readSessionData() async {
    var storage = const FlutterSecureStorage();
    
    final accessToken = await storage.read(key: Constant.accessToken);
    state = state.copyWith(accessToken: accessToken);
  }
}

final userProvider = StateNotifierProvider<UserState, User>((ref) {
  return UserState();
});
