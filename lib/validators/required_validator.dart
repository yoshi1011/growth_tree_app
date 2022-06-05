class RequiredValidator {
  static String? validate(dynamic value) {
    if (value == null) {
      return '入力必須項目です。';
    }
    return null;
  }
}
