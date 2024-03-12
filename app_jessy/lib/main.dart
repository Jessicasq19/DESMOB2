import 'package:app_jessy/tela2.dart';
import 'package:app_jessy/tela4.dart';
import 'package:app_jessy/tela5.dart';
import 'package:flutter/material.dart';
import 'package:app_jessy/tela3.dart';

void main() {
  // runApp função que constroi a tela do app
  // MaterialApp função do widget para android
  // home parametro inicial para chamar a tela
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  // COnstroi a tela do aplicativo
  Widget build(BuildContext context) {
    // Scaffold layout semipronto para criar o aplicativo
    return Scaffold(
      // app bar é a barra do aplicativo
      appBar: AppBar(
        title: Text("Aula 03 - Tela 1"),
      ),
      // body é o corpo do Scaffold
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //alinhamento pincipal do widget column
        // children estabelce relação com os demais widgets com a coluna
        children: [
          Container(
              color: Colors.blueAccent,
              width: 400,
              height: 180,
              child: Text(
                "Tela 1",
                style: TextStyle(fontSize: 25),
              )),
              //child é a relação com um widgets
              //navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSecundaria(),));
              }, child: Text("Tela 2")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela3()));
              }, child: Text("Tela 3")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => tela4()));
              }, child: Text("Contador")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Telatexto()));
              }, child: Text("Texto"))
        ],
        
      ),
    );
  }
}
