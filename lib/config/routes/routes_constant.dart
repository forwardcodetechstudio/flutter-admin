sealed class RoutesName {
  /* Authentication */
  static const String login = 'login';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';

  /* Dashboard */
  static const String dashboard = "dashboard";
  static const String crm = 'crm';
  static const String addListing = 'addListing';
  static const String listing = 'listing';
  static const String category = 'category';
  static const String createCategory = 'createCategory';
  static const String updateCategory = 'updateCategory';

  /* Company */
  static const String companyListing = 'companyList';
  static const String createNewCompany = 'createCompany';
  static const String updateCompany = 'updateCompany';
}

sealed class RoutesPath {
  /* Authentication */
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget-password';

  /* Dashboard */
  static const String crm = 'crm';
  static const String addListing = 'add-listing';
  static const String listing = 'listing';
  static const String category = 'category';
  static const String createCategory = 'create-category';
  static const String updateCategory = 'update-category';

  /* Company */
  static const String companyList = 'company-list';
  static const String createNewCompany = 'create-company';
  static const String updateCompany = 'update-company';
}
