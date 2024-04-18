import 'package:flutter/material.dart';
import 'categories_list_item.dart';
import '../../../utils/categories.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Category.values.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: CategoriesListItem(index: index),
        );
      },
    );
  }
}
