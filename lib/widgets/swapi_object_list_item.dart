import 'package:flutter/material.dart';
import '../models/swapi_object.dart';
import 'like_button.dart';

import '../screens/details_screen/details_screen.dart';
import '../utils/constants.dart';

class SwapiObjectListItem extends StatelessWidget {
  final SwapiObject object;
  const SwapiObjectListItem({required this.object, super.key});

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
        child: Text(object.name, style: Theme.of(context).textTheme.bodyLarge),
      ),
      trailing: LikeButton(
        object: object,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: DetailsScreenArguments(object: object),
        );
      },
    );
  }
}
