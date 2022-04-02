import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class UserNotifier extends StateNotifier<Map> {
  UserNotifier(): super({'aaaa': 'aaaaaa'});

  Future<int> login(String email, String password) async {
    var uri = Uri.parse('http://localhost:3000/auth/sign_in');
    var response =
        await http.post(uri, body: {'email': email, 'password': password});
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    state = decodedResponse['data'] as Map;
    return 200;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Map>((ref) {
  return UserNotifier();
});
