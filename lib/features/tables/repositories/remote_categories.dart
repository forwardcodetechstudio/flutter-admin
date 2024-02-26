import 'dart:io';
import 'package:flutter_admin/features/tables/models/category.dart';
import 'package:http/http.dart' as http;

class RemoteCategory {
  static const String baseUrl = 'dev.anbocas.com';

  RemoteCategory();

  Future<Category?> getAllCategories() async {
    const bool paginate = false;
    final Uri uri = Uri.https(
      baseUrl,
      'api/v1/categories',
      {
        'paginate': paginate,
        //'page': page,
        //'page_length': 10,
        //'search': null
      },
    );
    final http.Response response = await http.Client().get(uri);

    print("Category ::::::::::::::::::::::::::::::::::::::");
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return categoryFromJson(response.body);
    }

    return null;
  }
}
