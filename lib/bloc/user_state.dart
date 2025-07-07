// bloc/user_state.dart
import 'package:rickandmorty/domain/entities/character.dart';

import '../domain/entities/user.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  UserLoaded(this.users);
}

class GetCharacterSuccess extends UserState {
  final List<Character> characters;
  GetCharacterSuccess(this.characters);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
