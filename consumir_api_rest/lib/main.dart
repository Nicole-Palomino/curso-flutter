import 'dart:convert';

import 'package:consumir_api_rest/models/Gif.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Consumir API Rest'),
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

  var _url = Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=UaImb9eTOUi51AGjJMSws9ZmrglZFCmS&limit=10&offset=0&rating=g&bundle=messaging_non_clips');

  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(_url);

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for ( var item in jsonData["data"] ) {
        gifs.add(
          Gif(item["title"], item["images"]["original"]["url"])
        );
      }

      return gifs;

    } else {
      throw Exception('Fallo la conexión');
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _listadoGifs, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: _listGifs(snapshot.data!),
            );
          } else {
            return Center(
              child: Text('No se encontraron datos'),
            );
          }
        },
      )
    );
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(
        Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(gif.url, fit: BoxFit.fill,)
              ),
            ],
          ),
        )
      );
    }

    return gifs;
  }
}
