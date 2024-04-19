import 'package:star_war_bloc/models/swapi_object.dart';

abstract class LikesEvents {}

class AddToLikes extends LikesEvents {
  final SwapiObject object;
  AddToLikes(this.object);
}

class RemoveFromLikes extends LikesEvents {
  final SwapiObject object;
  RemoveFromLikes(this.object);
}

class GetLikes extends LikesEvents {}
