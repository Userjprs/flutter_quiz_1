import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> searchDjango(String query) async {
    String url = 'http://127.0.0.1:8000/admin/?search=$query';

    http.Response response = await http.get(Uri.encodeFull(url) as Uri);

    return response.body;
  }

  static searchDjangoApi(value) {}
}
