import 'package:star_war_bloc/models/swapi_object.dart';

abstract class LikesState {
  final List<SwapiObject> likes;
  LikesState({List<SwapiObject>? likes}) : likes = likes ?? [];
}

class LikesInitial extends LikesState {
  LikesInitial();
}

class LikesLoaded extends LikesState {
  LikesLoaded(List<SwapiObject> likes) : super(likes: likes);
}

class LikesError extends LikesState {
  final String message;
  LikesError(this.message);
}
