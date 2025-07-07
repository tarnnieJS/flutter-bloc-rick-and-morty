// data/repositories/user_repository_impl.dart
// data/repositories/user_repository_impl.dart
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rickandmorty/data/models/character_response_model.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio dio;

  UserRepositoryImpl(this.dio);

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get('/user');

      final List<dynamic> jsonList = response.data is List
          ? response.data
          : json.decode(response.data as String);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  @override
  Future<CharacterResponse> getCharacters() async {
    try {
      final response = await dio.get("https://rickandmortyapi.com/api/character");

      if (response.statusCode == 200) {
        final jsonMap = response.data;
        final model = CharacterResponseModel.fromJson(jsonMap);
        return model.toEntity();
      } else {
        throw Exception("Failed to load characters");
      }
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
  
}
