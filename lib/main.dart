import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/di/di.dart' as di;
import 'bloc/user_bloc.dart';
import 'screens/user_list_screen.dart';


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => di.serviceLocator<UserBloc>(),
        child: const UserListScreen(),
      ),
    );
  }
}
