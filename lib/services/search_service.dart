import '/models/swapi_object.dart';
import '/utils/categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchService {
  Future<List<SwapiObject>> search(Category category, String query) async {
    String url =
        "https://swapi.dev/api/${getCategoryName(category)}/?search=$query";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          Map<String, dynamic>.from(json.decode(response.body));
      List<dynamic> results = jsonResponse['results'];
      return results.map((e) => SwapiObject.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ${category.name}: $query');
    }
  }
}
