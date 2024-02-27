sealed class RoutesName {
  /* Authentication */
  static const String login = 'login';
  static const String register = 'register';

  /* Dashboard */
  static const String dashboard = "dashboard";
  static const String crm = 'crm';
  static const String addListing = 'addListing';
  static const String listing = 'listing';
  static const String category = 'category';
  static const String createCategory = 'createCategory';
}

sealed class RoutesPath {
  /* Authentication */
  static const String login = '/login';
  static const String register = '/register';

  /* Dashboard */
  static const String crm = '/crm';
  static const String addListing = '/add-listing';
  static const String listing = '/listing';
  static const String category = '/category';
  static const String createCategory = '/create-category';
}
