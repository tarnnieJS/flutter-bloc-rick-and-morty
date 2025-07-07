// domain/entities/character.dart

class CharacterResponse {
  final Info? info;
  final List<Character>? results;

  const CharacterResponse({this.info, this.results});
}

class Info {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const Info({this.count, this.pages, this.next, this.prev});
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}

class CharacterLocation {
  final String name;
  final String url;

  const CharacterLocation({required this.name, required this.url});
}
