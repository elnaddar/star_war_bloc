import 'dart:convert';

import '../models/swapi_object_details.dart';
import '../models/swapi_object.dart';
import '../utils/categories.dart';
import 'package:http/http.dart' as http;

class SwapiService {
  static const String _baseUrl = 'https://swapi.dev/api';

  Future<List<SwapiObject>> getAll(Category category) async {
    String url = '$_baseUrl/${category.name}';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          Map<String, dynamic>.from(json.decode(response.body));

      List<dynamic> results = jsonResponse['results'];
      return results.map((e) => SwapiObject.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ${category.name}');
    }
  }

  Future<SwapiObjectDetails> getDetails(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          Map<String, dynamic>.from(json.decode(response.body));

      return SwapiObjectDetails.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load');
    }
  }
}
