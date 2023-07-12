import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_full/other_page.dart';

import 'blocs/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
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
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Counter is ${state.counter}'),
                );
              });
        } else if (state.counter == -1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const OtherPage();
            }),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${context.watch<CounterBloc>().state.counter}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(incrementCounterEvent());
              },
              tooltip: 'Increment',
              backgroundColor: Colors.black12,
              splashColor: Colors.teal.shade50,
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(decrementCounterEvent());
              },
              tooltip: 'Decrement',
              backgroundColor: Colors.red.shade300,
              splashColor: Colors.teal.shade50,
              child: const Icon(Icons.remove),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
