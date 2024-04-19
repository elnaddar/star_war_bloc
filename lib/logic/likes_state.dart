import 'package:star_war_bloc/models/swapi_object.dart';

abstract class LikesState {
  final List<SwapiObject> likes;
  const LikesState({List<SwapiObject>? likes}) : likes = likes ?? const [];
}

class LikesInitial extends LikesState {
  const LikesInitial();
}

class LikesLoaded extends LikesState {
  const LikesLoaded(List<SwapiObject> likes) : super(likes: likes);
}

class LikesError extends LikesState {
  final String message;
  const LikesError(this.message);
}
