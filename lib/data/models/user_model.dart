// data/models/user_model.dart

import 'package:rickandmorty/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required int id, required String name})
      : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name']);
  }
}
