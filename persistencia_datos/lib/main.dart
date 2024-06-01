import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const MyHomePage(title: 'Shared Preferences'),
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

  int value = 0;

  _changeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    setState(() {
      value += 1;
      prefs.setInt("value", value);
    });
  }

  @override
  void initState() {
    super.initState();

    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    setState(() {
      value = prefs.getInt("value") ?? 0;
    });
  }

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
            Container(
              child: Text(value.toString(), style: TextStyle(fontSize: 30),)
            ),
            ElevatedButton(
              onPressed: _changeValue, 
              child: Text('Aumentar valor')
            )
          ],
        )
      ),
    );
  }
}
