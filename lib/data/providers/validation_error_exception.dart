class ValidationErrorException implements Exception {
  final Map<String, dynamic> validationErrors;

  ValidationErrorException(this.validationErrors);

  @override
  String toString() {
    // بدلاً من طباعة الرسالة، يمكن أن تعود بسطر فارغ أو رسالة عامة
    return 'Validation Error Occurred';
  }
}
