import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/bloc/user_bloc.dart';
import 'package:rickandmorty/data/client/dio_client.dart';
import 'package:rickandmorty/data/repositories/user_repository_impl.dart';
import 'package:rickandmorty/domain/usecases/get_users.dart';
import 'package:rickandmorty/domain/repositories/user_repository.dart'; // ⬅️ อย่าลืม import interface

final serviceLocator = GetIt.instance;

void init() {

    final dioClient = DioClient();
  serviceLocator.registerFactory<Dio>(() => dioClient.dio);

  // Repository (bind interface -> impl)
  serviceLocator.registerFactory<UserRepository>(
    () => UserRepositoryImpl(serviceLocator<Dio>()),
  );
  // UseCases
  serviceLocator.registerFactory(() => GetUsers(serviceLocator()));
  serviceLocator.registerFactory(() => GetCharacters(serviceLocator()));


  // Bloc
  serviceLocator.registerFactory(() => UserBloc(serviceLocator(), serviceLocator()));

 
}
