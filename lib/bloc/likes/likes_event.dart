import 'package:star_war_bloc/models/swapi_object.dart';

abstract class LikesEvents {
  const LikesEvents();
}

class AddToLikes extends LikesEvents {
  final SwapiObject object;
  const AddToLikes(this.object);
}

class RemoveFromLikes extends LikesEvents {
  final SwapiObject object;
  const RemoveFromLikes(this.object);
}

class GetLikes extends LikesEvents {
  const GetLikes();
}
