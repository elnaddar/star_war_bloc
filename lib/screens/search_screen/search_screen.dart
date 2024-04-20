import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_war_bloc/bloc/search/search_bloc.dart';
import 'package:star_war_bloc/bloc/search/search_events.dart';
import '/utils/categories.dart';

import 'widgets/search_results.dart';

class SearchScreenArguments {
  final Category category;

  SearchScreenArguments(this.category);
}

class SearchScreen extends StatelessWidget {
  final Category category;
  static const String routeName = '/search';
  const SearchScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: TextField(
          onChanged: (value) {
            context
                .read<SearchBloc>()
                .add(Search(category: category, query: value));
          },
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 30,
            ),
            border: UnderlineInputBorder(),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 1,
            opacity: 0.3,
            image: AssetImage('assets/background.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: const SearchResults(),
      ),
    );
  }
}
