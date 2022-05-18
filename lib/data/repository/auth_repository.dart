// Dart imports:
import 'dart:html';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../models/result.dart';
import '../../models/user.dart';
import '../api/auth_api.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository {
  AuthRepository(this._reader);

  final Reader _reader;

  late final AuthApi _api = _reader(authApiProvider);

  Future<Result<User?>> validateToken() async {
    return Result.recieveFuture(() async => await _api.validateToken());
  }
  // Future<AsyncValue<User?>> validateToken() async {
  //   return AsyncValue.guard(() async => await _api.validateToken());
  // }

  Future<Result<User>> login({required String email, required String password}) async {
    Map<String, dynamic> body = {'email': email, 'password': password};

    return Result.recieveFuture(() async => await _api.login(body));
  }

  Future<Result<dynamic>> signUp({
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
    String? addressLine2,}) async {

    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'birthday': birthday,
      'name': companyName,
      'zip_code': zipCode,
      'prefecture': prefecture,
      'city': city,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
    };

    return Result.recieveFuture(() async => await _api.signUp(body));
  }

  Future<Result<void>> logout() async {
    return Result.recieveFuture(() async => await _api.logout());
  }
}
