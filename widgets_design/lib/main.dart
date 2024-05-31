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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }
}


Widget cuerpo(){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://wallpaper.forfun.com/fetch/80/80cab248387486b8c2f6f4c8f067a1d3.jpeg"),
      fit: BoxFit.cover
      )
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          title(),
          campoUsuario(),
          campoPassword(),
          SizedBox(height: 10),
          btnEntrar(),
        ],
      ),
    ),
  );
}


Widget title(){
  return Text("Inicio de sesión", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),);
}

Widget campoUsuario(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Nombre de usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoPassword(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget btnEntrar(){
  return MaterialButton(
    color: Colors.amber,
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
    onPressed: (){},
    child: Text("Ingresa", style: TextStyle(fontSize: 25, color: Colors.white,),),
  );
}