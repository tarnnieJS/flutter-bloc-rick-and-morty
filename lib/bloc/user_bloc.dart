// bloc/user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/usecases/get_users.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  final GetCharacters getCharacters;


  UserBloc(this.getUsers, this.getCharacters) : super(UserInitial()) {



    
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await getCharacters();
        emit(GetCharacterSuccess(users.results ?? []));
        print("III" + users.results.toString()??[].toString());
      } catch (e) {
        emit(UserError('Failed to fetch users'));
      }
    });
    on<OnTapUser>((event, emit) {
      // Handle user tap event
      // You can navigate to a detail screen or perform any action with event.userId
      print('User tapped with ID: ${event.userId}');
    });
  }
}
