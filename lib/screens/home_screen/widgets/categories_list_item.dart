import 'package:flutter/material.dart';
import '../../categories_screen/category_screen.dart';
import '../../../utils/categories.dart';
import '../../../utils/constants.dart';

class CategoriesListItem extends StatelessWidget {
  final int index;

  const CategoriesListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      visualDensity: VisualDensity.standard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          getCategoryName(Category.values[index]).toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      trailing: const SizedBox(
        width: 50,
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryScreen.routeName,
          arguments: CategoryScreenArguments(Category.values[index]),
        );
      },
    );
  }
}
