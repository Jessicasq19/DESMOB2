import 'package:app_jessy/main.dart';
import 'package:app_jessy/tela2.dart';
import 'package:app_jessy/tela3.dart';
import 'package:app_jessy/tela4.dart';
import 'package:flutter/material.dart';

TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();
class Telatexto extends StatelessWidget {
  const Telatexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 03 - Campo Texto"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: "Digite seu nome"),
            /*onSubmitted: (String texto){
              print(texto);
            },*/
            controller: _user,
          ),
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: "Digite a senha"),
            obscureText: true,
            obscuringCharacter: "*",
            controller: _pass,
          ),
            ElevatedButton(onPressed: (){
              print(_user.text);
              print(_pass.text);
              }, child: Text("Exibir")),
              ElevatedButton(onPressed: (){
              _user.text = "";
              _pass.text = "";
              }, child: Text("Apagar")),
            ElevatedButton(onPressed: (){
                if (_user.text == "Jessy" && _pass.text == "1234")
                Navigator.push(context, MaterialPageRoute(builder: (context) => Telaprincipal()));
                else print("Login ou senha incorretos.")
                
                ;
              }, child: Text("Login")),


              //child é a relação com um widgets
              //navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => Telaprincipal()));
              }, child: Text("Tela 1")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela3()));
              }, child: Text("Tela 3")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => TelaSecundaria()));
              }, child: Text("Tela2")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => tela4()));
              }, child: Text("Contador"))
        ],
      ),
    );
  }
}