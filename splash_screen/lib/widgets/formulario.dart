import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:splash_screen/services/notification.dart';  

class FormCard extends StatefulWidget {
  const FormCard({super.key});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var cardMask = new MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') });
  var dateMask = new MaskTextInputFormatter(mask: '##/##', filter: { "#": RegExp(r'[0-9]') });
  var codeMask = new MaskTextInputFormatter(mask: '###', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network("https://www.mastercard.es/content/dam/public/mastercardcom/eu/es/images/Consumidores/escoge-tu-tarjeta/credito/credito-world/1280x720-mc-sym-card-wrld-ci-5BIN-mm.png"),
          SizedBox(height: 20,), 
          _inputNombre(),
          SizedBox(height: 10,),
          _inputCard(),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: _inputDate(),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: _inputCode(),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(
              onPressed: () {
                mostrarNotificacion();
              }, 
              child: Text("Realizar pago")
            ),
          )
        ],
      ),
    );
  }

  Container _inputNombre() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "Nombres y Apellidos",
            border: InputBorder.none
          ),
        ),
      );
  }

  Container _inputCard() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [cardMask],
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "0000 0000 0000 0000",
            border: InputBorder.none
          ),
        ),
      );
  }

  Container _inputDate() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [dateMask],
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "MM/YY",
            border: InputBorder.none
          ),
        ),
      );
  }

  Container _inputCode() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          inputFormatters: [codeMask],
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "000",
            border: InputBorder.none
          ),
        ),
      );
  }
}