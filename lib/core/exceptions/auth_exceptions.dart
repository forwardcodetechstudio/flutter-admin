abstract class AuthExceptions implements Exception {}

class InvalidCredential implements AuthExceptions {}

class LogoutFailure implements AuthExceptions {}
