import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<CharacterResponse> getCharacters();
  }