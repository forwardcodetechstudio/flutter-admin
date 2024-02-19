sealed class RoutesName {
  /* Authentication */
  static const String login = 'login';
  static const String register = 'register';

  /* Dashboard */
  static const String dashboard = "dashboard";
  static const String crm = 'crm';
}

sealed class RoutesPath {
  /* Authentication */
  static const String login = '/login';
  static const String register = '/register';

  /* Dashboard */
  static const String dashboard = "dashboard";
  static const String crm = '/$dashboard/crm';
}
