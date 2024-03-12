import 'package:app_jessy/main.dart';
import 'package:app_jessy/tela2.dart';
import 'package:app_jessy/tela3.dart';
import 'package:app_jessy/tela5.dart';
import 'package:flutter/material.dart';

class tela4 extends StatefulWidget {
  @override
  State<tela4> createState() => _tela4State();
}

int cont = 0;

class _tela4State extends State<tela4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 03 - Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                color: const Color.fromARGB(255, 243, 146, 178),
                width: 100,
                height: 100,
                child: Text(
                  "Contagem" + "$cont",
                  style: TextStyle(fontSize: 20),
                )),
          ),
              //child é a relação com um widgets
              //navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
              ElevatedButton(onPressed: (){
                setState(() {
                  cont++;
                });
              }, child: Icon(Icons.add)),

              ElevatedButton(onPressed: (){
                setState(() {
                  cont--;
                });
              }, child: Icon(Icons.remove)),

              ElevatedButton(onPressed: (){
                setState(() {
                  cont = 0;
                });
              }, child: Icon(Icons.reset_tv)),

              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => TelaSecundaria()));
              }, child: Text("Tela 2")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Telaprincipal()));
              }, child: Text("Tela 1")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela3()));
              }, child: Text("Tela 3")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Telatexto()));
              }, child: Text("Texto"))
        ],
      ),
    );
  }
}