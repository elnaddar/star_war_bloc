import 'package:flutter/material.dart';
import '/utils/categories.dart';

import 'widgets/search_results.dart';

class SearchScreenArguments {
  final Category category;

  SearchScreenArguments(this.category);
}

class SearchScreen extends StatelessWidget {
  final Category category;
  static const String routeName = '/search';
  const SearchScreen({Key? key, required this.category}) : super(key: key);

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
            // TODO: Write your code here
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
