import 'package:star_war_bloc/models/swapi_object.dart';

abstract class SearchState {
  final List<SwapiObject> results;
  SearchState({List<SwapiObject>? results}) : results = results ?? [];
}

class SearchInitial extends SearchState {
  SearchInitial();
}

class SearchLoading extends SearchState {
  SearchLoading();
}

class SearchLoaded extends SearchState {
  SearchLoaded(List<SwapiObject> results) : super(results: results);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
