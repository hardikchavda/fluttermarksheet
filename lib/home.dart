import 'package:flutter/material.dart';
import 'package:myapp/marksheet.dart';
import 'package:myapp/navigatiodrawer.dart';
import 'package:myapp/pageroutes.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);
  static const String routeName = 'HomeApp';

  static const appTitle = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const MyHomePage(title: appTitle),
      routes: {
        pageroutes.home: (context) => const HomeApp(),
        pageroutes.marksheet: (context) => const MarkSheet(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Home!'),
      ),
      drawer: const navigationdrawer(),
    );
  }
}
