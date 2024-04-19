import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_war_bloc/models/swapi_object.dart';

class StorageService {
  Future<void> save(List<SwapiObject> values) async {
    SharedPreferences prfes = await SharedPreferences.getInstance();
    List<String> objects = values.map((e) => json.encode(e.toJson())).toList();
    await prfes.setStringList('likes', objects);
  }

  Future<List<SwapiObject>> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> objects = prefs.getStringList('likes') ?? [];
    return objects.map((e) => SwapiObject.fromJson(json.decode(e))).toList();
  }
}
