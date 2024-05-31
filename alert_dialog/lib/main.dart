import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AlertDialog'),
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
  bool _suscrito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              textColor: Color(0xffffffff),
              child: Text('Suscribirme', 
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _mostrarAlerta(context);
              }),
            SizedBox(height: 100,),
            Text(
              _suscrito ? 'Suscrito' : 'No suscrito', 
            style: TextStyle(fontSize: 20),)  
          ],
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _suscrito ? 'Cancelar suscripción' : 'Suscribirse'),
          content: Text(
            _suscrito ? '¿Quieres cancelar tu suscripción?' : '¿Estás seguro que quieres suscribirte?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _suscrito = !_suscrito;
                });
                Navigator.pop(context);
              }, 
            child: Text('Si quiero'))
          ],
        );
      },
    );
  }
}
