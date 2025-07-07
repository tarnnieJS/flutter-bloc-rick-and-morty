import 'package:rickandmorty/domain/entities/character.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);
  Future<List<User>> call() => repository.getUsers();
}

class GetCharacters {
  final UserRepository repository;
  GetCharacters(this.repository);
  Future<CharacterResponse> call() => repository.getCharacters();
}