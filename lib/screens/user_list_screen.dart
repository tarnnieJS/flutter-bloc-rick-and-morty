// screens/user_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            context.read<UserBloc>().add(LoadUsers());
            return const Center(child: Text('Starting...'));
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCharacterSuccess) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return
                GestureDetector(
                  onTap: () {
                    context.read<UserBloc>().add(OnTapUser(character.id.toString()));
                  },
                  child: Row( 
                  children: [
                    Image.network( character.image ?? '', width: 50, height: 50),
                    Text(character.name ?? 'Unknown'),
                  ],
                )
                );
            
              },
            );
              
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
