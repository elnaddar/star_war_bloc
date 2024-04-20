import 'package:flutter/foundation.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class Search extends SearchEvent {
  final String query;
  final Category category;
  const Search({required this.query, required this.category});
}
