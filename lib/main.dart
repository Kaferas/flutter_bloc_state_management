import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_full/other_page.dart';
import 'blocs/counter/counter_bloc.dart';
import 'blocs/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:state.appTheme ==AppTheme.light ? ThemeData.light() : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text(
              "Change Theme",
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              final int randInt = Random().nextInt(10);
              print('randInt: $randInt');
              BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(randInt: randInt));
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
