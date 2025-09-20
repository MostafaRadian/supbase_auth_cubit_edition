import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_auth_cubit_edition/screens/login_screen.dart';

import 'cubits/auth_cubit.dart';
import 'cubits/bloc_observer.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://mracralljzfmlmahnsve.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1yYWNyYWxsanpmbWxtYWhuc3ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgwMzI0OTksImV4cCI6MjA3MzYwODQ5OX0.6CCIV4mlYnv7gsBLQjv3bqLmKbA_ztBLTx5POT7Mfvw',
  );
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
      ),
    );
  }
}
