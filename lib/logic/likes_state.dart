import 'package:star_war_bloc/models/swapi_object.dart';

abstract class LikesState {
  List<SwapiObject> likes = [];
  LikesState();
}

class LikesInitial extends LikesState {
  LikesInitial();
}

class LikesLoaded extends LikesState {
  LikesLoaded(List<SwapiObject> likes) {
    this.likes = likes;
  }
}

class LikesError extends LikesState {
  final String message;
  LikesError(this.message);
}
