import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:splash_screen/services/notification.dart';
import 'package:splash_screen/widgets/formulario.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OSM Tácticas'),
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
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top:50, bottom: 20),
                child: Image.network("https://i.postimg.cc/W4YtNMWq/OSM.png"),
              ),
              Text("OSM Tácticas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(20),
                color: Colors.grey[100],
                width: double.infinity,
                child: Text("Inicio"),
              ),
              Expanded(
                child: Container()
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(20),
                color: Colors.black87,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Log out", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FormCard() 
    );
  }
}
