enum Category { people, films, starships, vehicles, species, planets }

// Get the category name
String getCategoryName(Category category) {
  switch (category) {
    case Category.people:
      return 'People';
    case Category.films:
      return 'Films';
    case Category.starships:
      return 'Starships';
    case Category.vehicles:
      return 'Vehicles';
    case Category.species:
      return 'Species';
    case Category.planets:
      return 'Planets';
    default:
      throw Exception('Unknown category');
  }
}
