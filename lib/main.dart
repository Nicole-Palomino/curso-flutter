import 'package:bottom_navigation_bar/pages/pagina_home.dart';
import 'package:bottom_navigation_bar/pages/pagina_settings.dart';
import 'package:bottom_navigation_bar/pages/pagina_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated Container'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _paginaActual = 0;

  List<Widget> _paginas = [
    PaginaHome(),
    PaginaUser(),
    PaginaSettings()
  ];

  List<String> _titles = [
    'Animated Container',
    'Carrusel',
    'Settings'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _paginaActual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_titles[_paginaActual]),
      ),
      body:_paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'Users'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ],
      ),
    );
  }
}
