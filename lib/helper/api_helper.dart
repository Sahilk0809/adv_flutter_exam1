import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class QuotesApiHelper {
  String api = 'http://api.quotable.io/quotes';

  Future<Map> fetchApi() async {
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
