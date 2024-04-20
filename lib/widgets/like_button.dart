import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_war_bloc/bloc/likes/likes_bloc.dart';
import 'package:star_war_bloc/bloc/likes/likes_event.dart';
import 'package:star_war_bloc/bloc/likes/likes_state.dart';
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
        child: BlocBuilder<LikesBloc, LikesState>(builder: (context, state) {
          if (state is LikesLoaded &&
              state.likes.any((element) => element.url == object.url)) {
            return IconButton(
                onPressed: () =>
                    context.read<LikesBloc>().add(RemoveFromLikes(object)),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ));
          }
          return IconButton(
              onPressed: () =>
                  context.read<LikesBloc>().add(AddToLikes(object)),
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ));
        }),
      ),
    );
  }
}
