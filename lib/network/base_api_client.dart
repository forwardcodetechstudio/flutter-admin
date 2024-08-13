abstract class BaseApiClient {
  void initialize();

  Future<dynamic> get(String url, {Map<String, dynamic> parameters});
  Future<dynamic> post(String url, {Object data});
  Future<dynamic> put(String url, {Object data});
  Future<dynamic> delete(String url, {Map<String, dynamic> parameters});
}
