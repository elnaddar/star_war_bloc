import 'package:flutter/material.dart';
import '../models/swapi_object.dart';

class LikeButton extends StatelessWidget {
  final SwapiObject object;
  const LikeButton({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
