import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search/search_bloc.dart';
import '../../../bloc/search/search_states.dart';
import '../../../widgets/swapi_object_list_item.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<SearchBloc>(context),
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchLoaded) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: SwapiObjectListItem(
                        object: state.results[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        if (state is SearchError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox();
      },
    );
  }
}
