import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

final signUpViewModelProvider =
StateNotifierProvider((ref) => SignUpViewModel(ref.read));

class SignUpViewModel extends StateNotifier<AsyncValue<User>> {
  SignUpViewModel(this._reader) : super(const AsyncLoading());

  final Reader _reader;

  late final UserStateNotifier _userStateNotifier = _reader(userStateNotifier.notifier);

  Future<void> signUp(
      String email,
      String password,
      String firstName,
      String lastName,
      String birthday,
      String companyName,
      String zipCode,
      String prefecture,
      String city,
      String addressLine1,
      String? addressLine2) async {
    if (email.isEmpty & password.isEmpty) {
      return;
    }

    await _userStateNotifier.signUp(
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
    );
  }
}