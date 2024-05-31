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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  List<Persona> _personas = [
    Persona("Emilia", "Benites", "+51 940678334"),
    Persona("Nicole", "Palomino", "+51 945678845"),
    Persona("Andrea", "Velez", "+51 956798345"),
    Persona("Fabián", "Ruiz", "+51 999834566"),
    Persona("Carmen", "Alvarado", "+51 989343565"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: (){
              this._borrarPersona(context, _personas[index]);
            },
            title: Text(_personas[index].name + ' ' + _personas[index].lastname),
            subtitle: Text(_personas[index].phone),
            leading: CircleAvatar(
              child: Text(_personas[index].name.substring(0,1)),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios
            ),
          );
        },
      )
    );
  }

  _borrarPersona(context,Persona persona) {
    showDialog(
      context: context, 
      builder: ( _ ) => AlertDialog(
        title: Text('Eliminar contacto'),
        content: Text('¿Estás seguro de querer eliminar a ' + persona.name + '?'),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            }, child: Text('Cancelar'),
          ),
          MaterialButton(
            onPressed: () {
              print(persona.name);
              this.setState(() {
                this._personas.remove(persona);  
              });
              Navigator.pop(context);
            }, child: Text('Eliminar', style: TextStyle(color: Colors.red),),
          )
        ],
      )
    );
  }
}

class Persona {
  String name;
  String lastname;
  String phone;

  Persona(this.name, this.lastname, this.phone);
}
