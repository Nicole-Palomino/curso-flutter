import 'dart:math';

import 'package:flutter/material.dart';

class PaginaHome extends StatefulWidget {
  const PaginaHome({super.key});

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10.0);

  void _cambiarContainer() {

    final random = Random();

    _width = random.nextInt(350).toDouble();
    _height = random.nextInt(350).toDouble();
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(20).toDouble());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _cambiarContainer,
            child: Text('Cambiar Container'),
          )
        ],
      )
    );
  }
}