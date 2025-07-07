
import 'package:rickandmorty/domain/entities/character.dart';

class CharacterResponseModel {
  final InfoModel? info;
  final List<CharacterModel>? results;

  const CharacterResponseModel({this.info, this.results});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    return CharacterResponseModel(
      info: json['info'] != null ? InfoModel.fromJson(json['info']) : null,
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
    );
  }

  CharacterResponse toEntity() => CharacterResponse(
        info: info?.toEntity(),
        results: results?.map((e) => e.toEntity()).toList(),
      );
}

// data/models/info_model.dart


class InfoModel {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const InfoModel({this.count, this.pages, this.next, this.prev});

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  Info toEntity() => Info(
        count: count,
        pages: pages,
        next: next,
        prev: prev,
      );
}


// data/models/character_model.dart


class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationModel origin;
  final CharacterLocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const CharacterModel({
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

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: CharacterLocationModel.fromJson(json['origin']),
        location: CharacterLocationModel.fromJson(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode']),
        url: json['url'],
        created: DateTime.parse(json['created']),
      );

  Character toEntity() => Character(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin.toEntity(),
        location: location.toEntity(),
        image: image,
        episode: episode,
        url: url,
        created: created,
      );
}

// data/models/character_location_model.dart

class CharacterLocationModel {
  final String name;
  final String url;

  const CharacterLocationModel({required this.name, required this.url});

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      CharacterLocationModel(
        name: json['name'],
        url: json['url'],
      );

  CharacterLocation toEntity() => CharacterLocation(name: name, url: url);
}
