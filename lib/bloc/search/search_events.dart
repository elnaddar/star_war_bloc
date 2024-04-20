import 'package:star_war_bloc/utils/categories.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class Search extends SearchEvent {
  final String query;
  final Category category;
  const Search({required this.query, required this.category});
}
