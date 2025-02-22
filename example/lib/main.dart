import 'package:animated_fab/animated_fab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedFAB(

          items: [
            FABItem(
              onPressed: () {},
              tooltip: 'Add',
              child: Icon(Icons.add),
              heroTag: 'add',
            ),
            FABItem(
              onPressed: () {},
              heroTag: 'edit',
              tooltip: 'Edit',
              child: Icon(Icons.edit),
            ),
            FABItem(
              onPressed: () {},
              heroTag: 'delete',
              tooltip: 'Delete',
              child: Icon(Icons.delete),
            ),
          ],
      ),
    );
  }
}

