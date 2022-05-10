class DateValidator {
  static String? validate(dynamic value) {
    if (!RegExp(r'\d{4}-\d{2}-\d{2}').hasMatch(value)) {
      return '入力形式に誤りがあります。yyyy-mm-ddの形式で入力してください';
    }
    return null;
  }
}
