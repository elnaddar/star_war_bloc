import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_war_bloc/bloc/search/search_events.dart';
import 'package:star_war_bloc/bloc/search/search_states.dart';
import 'package:star_war_bloc/models/swapi_object.dart';
import 'package:star_war_bloc/services/search_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<Search>(_mapSearchToState);
  }

  Future<FutureOr<void>> _mapSearchToState(
      Search event, Emitter<SearchState> emit) async {
    try {
      List<SwapiObject> results =
          await SearchService().search(event.category, event.query);
      emit(SearchLoaded(results));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      SearchError(e.toString());
    }
  }
}
