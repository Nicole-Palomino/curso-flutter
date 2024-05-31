import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget {
  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminos y condiciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Términos y condiciones', 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('Para usar esa aplicación es necesarip que acepte las condiciones',
            style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
            Text('Para usar esa aplicación es necesarip que acepte las condiciones'),
            Text('Para usar esa aplicación es necesarip que acepte las condiciones'),
            MaterialButton(
              onPressed: () => {
                  Navigator.pop(context)
              }, 
              padding: EdgeInsets.all(15),
              textColor: Colors.white,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Acepto todo', style: TextStyle(fontSize: 20),),
                  Icon(Icons.arrow_forward_ios)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
