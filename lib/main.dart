import 'package:flutter/material.dart';
import 'package:flutter_bloc_full/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_full/other_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
              style: const TextStyle(fontSize: 60),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            tooltip: "Decrement",
            splashColor: Colors.blueGrey,
            backgroundColor: Colors.green.shade200,
            child: const Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            tooltip: 'Increment',
            backgroundColor: const Color.fromARGB(255, 90, 85, 90),
            splashColor: Colors.blueGrey,
            child: const Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
