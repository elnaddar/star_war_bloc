import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../likes_screen/likes_screen.dart';

class LikesButton extends StatelessWidget {
  const LikesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LikesScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Likes'.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 10),
            SvgPicture.asset(
              "assets/BB8.svg",
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
