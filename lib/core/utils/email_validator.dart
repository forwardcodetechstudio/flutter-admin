String? emailValidator(String? email) {
  RegExp regExp = RegExp(r'^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');
  final isEmailVerified = regExp.hasMatch(email ?? '');
  if (!isEmailVerified) {
    return 'Please enter valid email';
  }

  return null;
}
