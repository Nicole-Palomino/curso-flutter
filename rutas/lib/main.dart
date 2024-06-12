import 'package:flutter/material.dart';

import 'screens/screens.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
        '/': (context) => HomePage(),
        '/other': (context) => OtraPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        MaterialPageRoute(builder: (context) => HomePage());
        return null;
      },
    );
  }
}
