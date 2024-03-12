import 'package:app_jessy/main.dart';
import 'package:app_jessy/tela2.dart';
import 'package:app_jessy/tela4.dart';
import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 03 - Tela 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: Colors.red,
              width: 400,
              height: 180,
              child: Text(
                "Tela 3",
                style: TextStyle(fontSize: 25),
              )),
              //child é a relação com um widgets
              //navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => TelaSecundaria()));
              }, child: Text("Tela 2")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Telaprincipal()));
              }, child: Text("Tela 1")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => tela4()));
              }, child: Text("Tela 4")),
              
        ],
      ),
    );
  }
}